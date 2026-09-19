import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/homeController.dart';

class EditNoteController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  CollectionReference notes = FirebaseFirestore.instance.collection("notes");
  late String docId;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      docId = Get.arguments['id'];
      name.text = Get.arguments['name'];
    }
  }

  editNote() async {
    if (formKey.currentState!.validate()) {
      try {
        await notes.doc(docId).update({'name': name.text});
        Get.back();
        Get.find<HomeController>().getData();
      } catch (e) {
        debugPrint("Error $e");
      }
    }
  }

  @override
  void onClose() {
    name.dispose();
    super.onClose();
  }
}
