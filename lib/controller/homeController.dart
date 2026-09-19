import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data = [];
  late bool isLoading;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    isLoading = true;
    update();
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection("notes")
        .get();
    data.clear();

    data.addAll(response.docs);
    isLoading = false;
    update();
  }

  deleteNote(String docId) async {
    try {
      await FirebaseFirestore.instance.collection("notes").doc(docId).delete();

      data.removeWhere((element) => element.id == docId);
      update();
    } catch (e) {
      print("Error in delete note : $e");
      throw Exception("An Error occurred while deleting this note");
    }
  }
}
