import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/homeController.dart';
import 'package:notes/view/components/customtext.dart';
import 'package:quickalert/quickalert.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/addelement");
        },
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(CupertinoIcons.add, color: Colors.white, size: 27),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TextForm(
          text: "home page",
          fontweight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return controller.isLoading
              ? Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.orange,
                    radius: 15,
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 160,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.info,
                          animType: QuickAlertAnimType.scale,
                          text: "ماذا تريد حذف / تعديل ",
                          cancelBtnText: "حذف",
                          confirmBtnText: "تعديل",
                          confirmBtnColor: Colors.orange,
                          confirmBtnTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          cancelBtnTextStyle: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          onCancelBtnTap: () {
                            Get.back();
                            String docid = controller.data[index].id;
                            controller.deleteNote(docid);
                          },
                          onConfirmBtnTap: () async {
                            Get.back();
                            Get.toNamed(
                              "/editnote",
                              arguments: {
                                "id": controller.data[index].id,
                                "name": controller.data[index]['name'],
                              },
                            );
                          },
                          showCancelBtn: true,
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Image.asset(
                                "assets/folder.webp",
                                height: 90,
                              ),
                            ),
                            TextForm(
                              text: controller.data[index]['name'],
                              fontweight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
