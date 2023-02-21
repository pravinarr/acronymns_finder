import 'package:acronyms_finder/blocs/search/widgets/search_items.dart';
import 'package:flutter/material.dart';

import '../../../models/lf.dart';

class Variations extends StatelessWidget {
  const Variations({Key? key, required this.lfItem}) : super(key: key);
  final LF lfItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                'Variations of ${lfItem.lf}',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Container(
              color: index % 2 == 0 ? Colors.white38 : Colors.white,
              height: 80,
              child: SearchItems(searchItem: lfItem.vars[index]),
            ),
          );
        },
        itemCount: lfItem.vars.length,
      ),
    );
  }
}
