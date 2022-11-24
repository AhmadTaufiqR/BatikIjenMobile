import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/components/autocomplite.dart';
import 'package:ijen_batik/components/navbar_top.dart';
import 'package:ijen_batik/view/dash.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      blurStyle: BlurStyle.normal,
                      color: Colors.black12,
                      spreadRadius: 70)
                ]),
              ),
              Stack(
                children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()));
                              },
                              child:
                                  SvgPicture.asset('assets/icon/arrowback.svg'),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Container(
                            child: Text(
                              "Search",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              autocom(),
            ],
          ),
        ),
      ),
    );
  }
}
