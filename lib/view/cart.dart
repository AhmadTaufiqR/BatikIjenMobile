import 'package:flutter/material.dart';

class PageCart extends StatefulWidget {
  const PageCart({Key? key}) : super(key: key);

  @override
  State<PageCart> createState() => _PageCartState();
}

class _PageCartState extends State<PageCart> {
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
