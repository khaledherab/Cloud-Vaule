import 'package:get/instance_manager.dart';
import 'package:notes/controller/addnotesController.dart';
import 'package:notes/controller/editenotecontroller.dart';
import 'package:notes/controller/homeController.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.put(AddNoteController());
    Get.lazyPut(() => EditNoteController(), fenix: true);
  }
}
