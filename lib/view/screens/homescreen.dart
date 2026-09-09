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
                          type: QuickAlertType.warning,
                          animType: QuickAlertAnimType.scale,
                          text: "Do you want Delete this note",
                          onCancelBtnTap: () {
                            Get.back();
                          },
                          cancelBtnText: "Cancel",
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
