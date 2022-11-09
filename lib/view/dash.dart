import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/components/autocomplite.dart';
import 'package:ijen_batik/components/card.dart';
import 'package:ijen_batik/components/categories.dart';
import 'package:ijen_batik/components/navbar_top.dart';
import 'package:ijen_batik/view/login_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    login(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            navbar_atas(
              img: "assets/logo/1.png",
              img1: "assets/logo/2.png",
              img2: "assets/logo/keranjang.png",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: autocom(),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Categories",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Text(
                      "See All",
                      style:
                          GoogleFonts.dmSans(fontSize: 16, color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const CategoryProduk(),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color.fromRGBO(250, 250, 250, 100),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15, left: 15, top: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Recomendasi",
                            style: GoogleFonts.dmSans(fontSize: 16),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()));
                          },
                          child: Text(
                            "See All",
                            style: GoogleFonts.dmSans(
                                fontSize: 16, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  listcard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(54, 105, 201, 100),
        onTap: _onItemTapped,
      ),
    );
  }
}
