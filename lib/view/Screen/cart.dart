import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/service/service.dart';
import 'package:ijen_batik/service/sqlhalper.dart';

class PageCart extends StatefulWidget {
  const PageCart({Key? key}) : super(key: key);

  @override
  State<PageCart> createState() => _PageCartState();
}

class _PageCartState extends State<PageCart> {
  GetxSnippet snip = GetxSnippet();
  List<Map<String, dynamic>> listData = [];
  void refresh() async {
    var data = await SQLHelper.getItems();
    setState(() {
      listData = data;
      // print(listData);
    });
  }

  double get totalAmount => listData.fold(
      0.0, (sum, element) => sum + element['harga'] * element['jumlah']);

  void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Berhasil Menghapus Barang!'),
    ));
  }

  void _updataItem(int id, inc) async {
    var hitung = inc++;
    await SQLHelper.updateItem(id, hitung);
    refresh();
  }

  void updatedeleteItem(int id, dnc) async {
    var hitung = dnc--;
    await SQLHelper.updateItem(id, hitung);
    refresh();
  }

  @override
  void initState() {
    refresh();

    super.initState();
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
            titleSpacing: 175,
            title: Text(
              "Cart",
              style: GoogleFonts.dmSans(color: Colors.black),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listData.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Card(
                    color: Colors.blueGrey[100],
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(listData[index]['nama']),
                      subtitle: Text(listData[index]['harga'].toString()),
                      leading: Image.network(
                        "https://sanggar-batik.wstif3a-bws.id/gambar/${listData[index]['gambar']}",
                        fit: BoxFit.fill,
                      ),
                      trailing: SizedBox(
                        width: 105,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.do_disturb_on,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  int id = listData[index]['id'];
                                  int dec = listData[index]['jumlah'];
                                  dec = dec - 1;
                                  updatedeleteItem(id, dec);
                                  refresh();
                                  if (dec == 0) {
                                    deleteItem(listData[index]['id']);
                                    refresh();
                                  }
                                });
                              },
                            ),
                            Text(listData[index]['jumlah'].toString()),
                            IconButton(
                                icon: const Icon(Icons.add_circle, size: 20),
                                onPressed: () {
                                  setState(() {
                                    int id = listData[index]['id'];
                                    int inc = listData[index]['jumlah'];
                                    inc++;
                                    _updataItem(id, inc);
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          snip.addshop(
                              totalAmount.toString(),
                              listData[index]['jumlah'].toString(),
                              listData[index]['harga'].toString(),
                              context);
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        "Pesan",
                        style: GoogleFonts.dmSans(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 110,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Total Harga :${totalAmount} ",
                    style: GoogleFonts.dmSans(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
