import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/view/widget/autocom.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            expandedHeight: 60,
            snap: true,
            titleSpacing: 120,
            title: Text(
              "Search",
              style: GoogleFonts.dmSans(color: Colors.black),
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 15,
              ),
              autocom(),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
