import 'package:flutter/material.dart';

class ProductListSearch extends StatefulWidget {
  const ProductListSearch({Key? key}) : super(key: key);

  @override
  State<ProductListSearch> createState() => _ProductListSearchState();
}

class _ProductListSearchState extends State<ProductListSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
