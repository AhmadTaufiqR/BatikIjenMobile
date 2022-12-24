import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/service/sqlhalper.dart';

class ProductView extends StatefulWidget {
  final Map? data1;
  ProductView({Key? key, this.data1}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  Map? datas;
  @override
  void initState() {
    datas = widget.data1;
    super.initState();
  }

  Future<void> additems() async {
    await SQLHelper.createItem(datas!['nama_produk'], datas!['gambar_produk'],
        datas!['harga_produk'], datas!['id_produk']);
  }

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
            leading: InkWell(
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black54),
              onTap: () => Navigator.pop(context),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                width: double.infinity,
                child: Image.network(
                  "http://10.0.2.2/api/baru/uploads/${datas!['gambar_produk']}",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        datas!['nama_produk'],
                        style: GoogleFonts.dmSans(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Rp. ${datas!['harga_produk']}',
                        style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Flexible(
              //   child: Text(
              //     datas!['rincian_produk'],
              //     overflow: TextOverflow.ellipsis,
              //     maxLines: 2,
              //     style: GoogleFonts.dmSans(fontSize: 12),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: GoogleFonts.dmSans(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${datas!['rincian_produk']}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () {
            additems();
          },
          style: OutlinedButton.styleFrom(
              side: const BorderSide(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            "Masukkan Keranjang",
            style: GoogleFonts.dmSans(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
