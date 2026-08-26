import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/elements/addelement.dart';
import 'package:notes/screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          elevation: 3,
          shadowColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        "homepage": (context) => Homepage(),
        "addelement": (context) => AddElement(),
      },
    );
  }
}
