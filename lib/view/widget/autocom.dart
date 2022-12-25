import 'package:flutter/material.dart';

class autocom extends StatefulWidget {
  const autocom({Key? key}) : super(key: key);

  @override
  State<autocom> createState() => _autocomState();
}

class _autocomState extends State<autocom> {
  List<String> items = <String>[
    'Angela',
    'Ardy',
    'Fizfat',
    'Dita',
    'Rimuru',
    'Deny',
    'John',
    'Roy',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: LayoutBuilder(builder: (context, constrains) {
        return Autocomplete<String>(
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return SizedBox(
              height: 50,
              child: TextField(
                controller: textEditingController,
                focusNode: focusNode,
                onSubmitted: (text) => onFieldSubmitted(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Search',
                  labelStyle: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
            );
          },
          onSelected: (String value) {
            //selected value
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return items.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          optionsViewBuilder: (context, onSelected, options) => Align(
            alignment: Alignment.topLeft,
            child: Material(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(4.0),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.88,
                margin: const EdgeInsets.only(top: 10.0),
                child: Wrap(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey[300]!,
                        ),
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          bool selected =
                              AutocompleteHighlightedOption.of(context) ==
                                  index;
                          String option = options.elementAt(index);
                          return InkWell(
                            onTap: () => onSelected(option),
                            child: Container(
                              height: 50.0,
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 10.0,
                                bottom: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: selected
                                    ? Theme.of(context).focusColor
                                    : null,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    index == 0 ? 12 : 0,
                                  ),
                                  topRight: Radius.circular(
                                    index == 0 ? 12 : 0,
                                  ),
                                  bottomLeft: Radius.circular(
                                    index == options.length - 1 ? 12 : 0.0,
                                  ),
                                  bottomRight: Radius.circular(
                                    index == options.length - 1 ? 12 : 0.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    option,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
