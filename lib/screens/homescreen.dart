import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/components/customtext.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<QueryDocumentSnapshot> data = [];
  getData() async {
    QuerySnapshot response = await FirebaseFirestore.instance
        .collection("notes")
        .get();

    data.addAll(response.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addelement");
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
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 200,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Image.asset("assets/folder.webp", height: 130),
                ),
                TextForm(
                  text: data[index]['name'],
                  fontweight: FontWeight.bold,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
