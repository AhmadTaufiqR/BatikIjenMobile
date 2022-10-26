import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/view/components/autocomplite.dart';
import 'package:ijen_batik/view/components/categories.dart';

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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 28, left: 10),
                      child: Image.asset(
                        "assets/logo/1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(top: 25, right: 30),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/logo/2.png",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25, right: 27),
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/logo/keranjang.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                  InkWell(
                    onTap: () {}, //TO DO: belum dinavigate
                    child: Text(
                      "See All",
                      style:
                          GoogleFonts.dmSans(fontSize: 16, color: Colors.blue),
                    ),
                  ),
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
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Recomendasi",
                      style: GoogleFonts.dmSans(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {}, //TO DO: belum dinavigate
                    child: Text(
                      "See All",
                      style:
                          GoogleFonts.dmSans(fontSize: 16, color: Colors.blue),
                    ),
                  ),
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
