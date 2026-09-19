import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:notes/core/appbinding.dart';
import 'package:notes/view/screens/addnotes.dart';
import 'package:notes/view/screens/editnote.dart';
import 'package:notes/view/screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          elevation: 3,
          shadowColor: Colors.black,
        ),
      ),
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/addelement", page: () => AddNotes()),
        GetPage(name: "/editnote", page: () => EditNote()),
      ],
    );
  }
}
