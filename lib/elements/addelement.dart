import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notes/components/custombuttonform.dart';
import 'package:notes/components/customtext.dart';
import 'package:notes/components/customtextfield.dart';

class AddElement extends StatefulWidget {
  const AddElement({super.key});

  @override
  State<AddElement> createState() => _AddElementState();
}

class _AddElementState extends State<AddElement> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  CollectionReference notes = FirebaseFirestore.instance.collection("notes");

  addnote() async {
    if (formKey.currentState!.validate()) {
      try {
        await notes.add({"name": name.text});
        Navigator.of(context).pushReplacementNamed("homepage");
      } catch (e) {
        debugPrint("Error $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          children: [
            CustomTextFormField(
              hint: "Enter name",
              controller: name,
              validator: (val) {
                if (val == "") return "can't be empty";
                return null;
              },
            ),
            Gap(40),
            ButtonForm(
              onpressed: () {
                addnote();
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
