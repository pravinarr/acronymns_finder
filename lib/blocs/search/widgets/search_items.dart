import 'package:acronyms_finder/blocs/search/widgets/variations.dart';
import 'package:flutter/material.dart';

import '../../../models/lf.dart';

class SearchItems extends StatelessWidget {
  const SearchItems({Key? key, required this.searchItem}) : super(key: key);

  final LF searchItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (searchItem.vars.isNotEmpty) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Variations(
              lfItem: searchItem,
            );
          }));
        }
      },
      title: Text(searchItem.lf),
      subtitle: Text('Freq: ${searchItem.freq}    Since: ${searchItem.since}'),
      isThreeLine: false,
      trailing: searchItem.vars.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Variations'),
                Icon(Icons.arrow_right_alt_sharp),
              ],
            )
          : null,
    );
  }
}
