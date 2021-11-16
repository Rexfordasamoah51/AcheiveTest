import 'package:flutter/material.dart';

/// Bone Search delegate
class SearchData extends SearchDelegate<String> {
  SearchData({required this.data});
  List data = [];
  final recentCities = [
    "Bitcoin",
    "Tether",
    "Solana",
    "Cardano",
    "Terra",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, 'null');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /// final result
    List result = [];

    //Get the asset name process search on it
    if (data.isNotEmpty) {
      data.asMap().forEach((index, element) {
        result.add(element['name']);
      });
    }

    //  query suggestion
    final _suggestionList = query.isEmpty
        ? recentCities
        : result.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemCount: _suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Text('💦'),
          title: Text(_suggestionList[index]),
        );
      },
    );
  }
}
