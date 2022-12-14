import 'package:flutter/material.dart';

class orderProduct extends StatefulWidget {
  const orderProduct({Key? key}) : super(key: key);

  @override
  State<orderProduct> createState() => _orderProductState();
}

class _orderProductState extends State<orderProduct> {
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
