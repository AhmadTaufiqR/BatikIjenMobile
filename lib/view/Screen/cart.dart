import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijen_batik/service/sqlhalper.dart';

class PageCart extends StatefulWidget {
  const PageCart({Key? key}) : super(key: key);

  @override
  State<PageCart> createState() => _PageCartState();
}

class _PageCartState extends State<PageCart> {
  List<Map<String, dynamic>> listData = [];
  var inc = 1;
  int hargaTotal = 0;
  void refresh() async {
    var data = await SQLHelper.getItems();
    setState(() {
      listData = data;
      // print(listData);
    });
  }

  void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
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
            leading: InkWell(
              onTap: () => Get.back(),
              child: Image.asset('assets/img/vector.png'),
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listData.length,
              itemBuilder: (context, index) => Card(
                color: Colors.blueGrey[100],
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                    title: Text(listData[index]['nama']),
                    subtitle: Text(listData[index]['harga'].toString()),
                    leading: Image.network(
                      "http://10.0.2.2/api/baru/uploads/${listData[index]['gambar']}",
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
                                //TODO: Masih belum bisa menambahkan berdasarkan id
                                if (inc == 0) {
                                  deleteItem(listData[index]['id']);
                                  refresh();
                                }
                              });
                            },
                          ),
                          Text(inc.toString()),
                          IconButton(
                              icon: const Icon(Icons.add_circle, size: 20),
                              onPressed: () {
                                //TODO: Masih belum bisa menambahkan berdasarkan id
                                setState(() {
                                  if (inc != 0) {
                                    //TODO: harga masih juga belum bisa
                                    hargaTotal = listData[index]['harga'] +
                                        listData[index]['harga'];
                                  }
                                });
                              }),
                        ],
                      ),
                    )),
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
                    "Total Harga : $hargaTotal",
                    style: GoogleFonts.dmSans(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {},
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
    );
  }
}
