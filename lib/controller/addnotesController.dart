import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/homeController.dart';

class AddNoteController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  CollectionReference notes = FirebaseFirestore.instance.collection("notes");

  addNote() async {
    if (formKey.currentState!.validate()) {
      try {
        await notes.add({"name": name.text});
        Get.back();
        Get.find<HomeController>().getData();
      } catch (e) {
        debugPrint("Error $e");
      }
    }
  }
}
