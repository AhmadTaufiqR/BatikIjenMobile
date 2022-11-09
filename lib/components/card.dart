import 'package:flutter/material.dart';

class listcard extends StatefulWidget {
  @override
  State<listcard> createState() => _listcardState();
}

class _listcardState extends State<listcard> {
  int product = 0;
  void _addproduct() {
    setState(() {
      product++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 170.0,
                  color: Colors.orange,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 170.0,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 18,
        ),
        SizedBox(
          height: 200.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 170.0,
                  color: Colors.red,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 170.0,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
