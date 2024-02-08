import 'package:flutter/material.dart';
import '../../../catalog/product_data.dart';
import 'my_search_delegate.dart';


class MySearchDelegate extends SearchDelegate<List<ProductData>> {
  final List<ProductData> mostSearchedProducts;
  final List<String> searchHistory;
  final List<ProductData> allProducts;

  MySearchDelegate({
    required this.mostSearchedProducts,
    required this.searchHistory,
    required this.allProducts,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, []);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductData> searchedItems = allProducts
        .where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (searchedItems.isNotEmpty) {
      return SearchResultsPage(
        mostSearchedProducts: mostSearchedProducts,
        searchHistory: searchHistory,
        searchedItems: searchedItems,
      );
    }

    return Center(
      child: Text('No results found for "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductData> filteredSuggestions = allProducts
        .where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSuggestions[index].title),
          onTap: () {
            query = filteredSuggestions[index].title;
            showResults(context);
          },
        );
      },
    );
  }
}
