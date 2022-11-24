import 'package:flutter/material.dart';

class searchNotFound extends StatefulWidget {
  const searchNotFound({Key? key}) : super(key: key);

  @override
  State<searchNotFound> createState() => searchNotFoundState();
}

class searchNotFoundState extends State<searchNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
