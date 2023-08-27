import 'package:flutter/material.dart';

import '../../../product/model/tag.dart';

class HomeSearchDelegate extends SearchDelegate<Tag?> {
  final List<Tag> tagItems;
  //ben tag listleri alacağım için sayfa açılırken listtagleri alalım.
  HomeSearchDelegate(this.tagItems);

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = tagItems.where((element) =>
        element.name?.toLowerCase().contains(query.toLowerCase()) ?? false);

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(results.elementAt(index).name ?? ''),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = tagItems.where((element) =>
        element.name?.toLowerCase().contains(query.toLowerCase()) ?? false);

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              close(context, results.elementAt(index));
            },
            title: Text(results.elementAt(index).name ?? ''),
          ),
        );
      },
    );
  }
}
