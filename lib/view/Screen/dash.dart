import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/service/service.dart';
import 'package:ijen_batik/view/Screen/login_page.dart';
import 'package:ijen_batik/view/widget/autocom.dart';
import 'package:ijen_batik/view/widget/buttomnav.dart';
import 'package:ijen_batik/view/widget/card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    GetxSnippet snip = GetxSnippet();
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            expandedHeight: 60,
            snap: true,
            leading: InkWell(
              child: Image.asset('assets/logo/1.png'),
            ),
            actions: <Widget>[
              InkWell(
                child: Image.asset('assets/logo/2.png'),
                onTap: () {},
              ),
              InkWell(
                child: Image.asset('assets/logo/keranjang.png'),
                onTap: () {},
              )
            ],
          )
        ],
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: const autocom(),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Row(
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.dmSans(fontSize: 20),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/category");
                      },
                      child: Text(
                        "See All",
                        style: GoogleFonts.dmSans(
                            fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
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
                          const EdgeInsets.only(right: 15, left: 15, top: 20),
                      child: Row(
                        children: [
                          Text(
                            "Recomendasi",
                            style: GoogleFonts.dmSans(fontSize: 20),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed("/rekomendasi");
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: FutureBuilder(
                        future: snip.allproduct(),
                        initialData: [],
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          List data = snapshot.data;
                          return snapshot.hasData
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 290,
                                          childAspectRatio: 0.65,
                                          crossAxisSpacing: 3,
                                          mainAxisSpacing: 3),
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Cardvalue(
                                      title: data[index]['nama_produk'],
                                      img:
                                          "http://10.0.2.2/api/baru/uploads/${data[index]['gambar_produk']}",
                                      harga: data[index]['harga_produk'],
                                    );
                                  },
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
