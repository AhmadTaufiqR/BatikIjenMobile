import 'package:flutter/material.dart';

class navbar_atas extends StatelessWidget {
  final String img;
  final String img1;
  final String? img2;
  const navbar_atas({
    Key? key,
    required this.img,
    required this.img1,
    this.img2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
            ),
            Container(
              padding: EdgeInsets.only(top: 28, left: 10),
              child: InkWell(
                child: Image.asset(
                  img,
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  print("Ini logo");
                },
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(top: 25, right: 30),
              child: InkWell(
                onTap: () {
                  print("Ini Lonceng");
                },
                child: Image.asset(img1),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, right: 27),
              child: InkWell(
                onTap: () {
                  print("Ini Keranjang");
                },
                child: Image.asset(img2.toString()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
