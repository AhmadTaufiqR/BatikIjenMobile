import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/components/autocomplite.dart';
import 'package:ijen_batik/components/navbar_top.dart';
import 'package:ijen_batik/view/dash.dart';

class ProductListCategory extends StatefulWidget {
  const ProductListCategory({Key? key}) : super(key: key);

  @override
  State<ProductListCategory> createState() => _ProductListCategoryState();
}

class _ProductListCategoryState extends State<ProductListCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            blurStyle: BlurStyle.normal,
                            color: Colors.black12,
                            spreadRadius: 80)
                      ]),
                    ),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()));
                                },
                                child: SvgPicture.asset(
                                    'assets/icon/arrowback.svg'),
                              ),
                            ),
                            Center(
                              widthFactor: 4.68,
                              child: Text(
                                "Category",
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()));
                              },
                              child: SvgPicture.asset('assets/icon/vector.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Text("Gadget",
                      style: GoogleFonts.dmSans(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 25,
                ),
                autocom(),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 230,
                            width: 185,
                            child: Card(
                              color: Colors.blue,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 230,
                            width: 185,
                            child: Card(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 230,
                            width: 185,
                            child: Card(
                              color: Colors.blue,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 230,
                            width: 185,
                            child: Card(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 230,
                            width: 185,
                            child: Card(
                              color: Colors.blue,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 230,
                            width: 185,
                            child: Card(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: BorderSide(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              "Filter & Sorting",
              style: GoogleFonts.dmSans(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
