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
        title: const Text("Order"),
        actions: const [],
      ),
    );
  }
}
