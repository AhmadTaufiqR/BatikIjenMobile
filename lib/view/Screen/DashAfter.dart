// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/models/categories.dart';
import 'package:ijen_batik/service/service.dart';
import 'package:ijen_batik/view/widget/autocom.dart';
import 'package:ijen_batik/view/widget/card.dart';
import 'package:ijen_batik/view/widget/categories.dart';

class DashboardAfter extends StatefulWidget {
  const DashboardAfter({super.key});

  @override
  State<DashboardAfter> createState() => _DashboardAfterState();
}

class _DashboardAfterState extends State<DashboardAfter> {
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
                        Get.toNamed("/categories");
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
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 84,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => CategoryCard(
                    image: categories[index].icon,
                    title: categories[index].title,
                    press: () {},
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 5),
                ),
              ),
              const SizedBox(
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
                        initialData: const [],
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
                                      data: data[index],
                                      desc: data[index]['rincian_produk'],
                                    );
                                  },
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
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
                          const EdgeInsets.only(right: 15, left: 15, top: 20),
                      child: Row(
                        children: [
                          Text(
                            "New Product",
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
                        initialData: const [],
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
                                      data: data[index],
                                      desc: data[index]['rincian_produk'],
                                    );
                                  },
                                )
                              : const Center(
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
