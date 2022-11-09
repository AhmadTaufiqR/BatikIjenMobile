import 'package:flutter/material.dart';

class pageviewimage extends StatefulWidget {
  const pageviewimage({Key? key}) : super(key: key);

  @override
  State<pageviewimage> createState() => _pageviewimageState();
}

class _pageviewimageState extends State<pageviewimage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return _builditem(position);
          }),
    );
  }

  Widget _builditem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, top: 50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
