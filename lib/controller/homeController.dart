import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List data = [];
  late bool isLoading;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    isLoading = true;
    update();
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection("notes")
        .get();
    data.clear();

    data.addAll(response.docs);
    isLoading = false;
    update();
  }
}
