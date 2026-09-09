import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:notes/controller/addnotesController.dart';
import 'package:notes/view/components/custombuttonform.dart';
import 'package:notes/view/components/customtext.dart';
import 'package:notes/view/components/customtextfield.dart';

class AddNotes extends GetView<AddNoteController> {
  const AddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        title: TextForm(
          text: "Add Element",
          fontweight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          children: [
            CustomTextFormField(
              hint: "Enter name",
              controller: controller.name,
              validator: (val) {
                if (val == "") return "can't be empty";
                return null;
              },
            ),
            Gap(40),
            ButtonForm(
              onpressed: () {
                controller.addNote();
              },
              child: TextForm(
                text: "Add",
                color: Colors.white,
                fontweight: FontWeight.bold,
              ),
              borderRadius: BorderRadius.circular(30),
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
