import 'package:flutter/material.dart';
import 'package:ijen_batik/service/service.dart';

class autocom extends StatefulWidget {
  const autocom({Key? key}) : super(key: key);

  @override
  State<autocom> createState() => _autocomState();
}

class _autocomState extends State<autocom> {
  TextEditingController search = TextEditingController();
  GetxSnippet snip = GetxSnippet();
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as argumentsSearch;
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: TextFormField(
        controller: search,
        decoration: const InputDecoration(
          labelText: 'Search',
          labelStyle: TextStyle(
            color: Colors.blueGrey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
        ),
        onEditingComplete: () {
          setState(() {
            snip.searchpage(search.text);
          });
          // print(search.text);
        },
      ),
    );
  }
}
