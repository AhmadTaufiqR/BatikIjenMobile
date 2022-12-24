import 'package:flutter/material.dart';
import 'package:ijen_batik/service/sqlhalper.dart';

class PageCart extends StatefulWidget {
  PageCart({Key? key}) : super(key: key);

  @override
  State<PageCart> createState() => _PageCartState();
}

class _PageCartState extends State<PageCart> {
  List<Map<String, dynamic>> listData = [];
  var inc = 0;
  void refresh() async {
    var data = await SQLHelper.getItems();
    setState(() {
      listData = data;
      // print(listData);
    });
  }

  void increment() {
    setState(() {
      inc++;
    });
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
            leading: const InkWell(
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.black54)),
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
                    subtitle: Text(listData[index]['jumlah'].toString()),
                    leading: Image.network(
                      "http://10.0.2.2/api/baru/uploads/${listData[index]['gambar']}",
                      fit: BoxFit.fill,
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.do_disturb_on),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
