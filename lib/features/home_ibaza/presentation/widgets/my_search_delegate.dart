import 'package:flutter/material.dart';
import 'package:profile_ibaza/features/home_ibaza/presentation/widgets/result.dart';
import '../../../catalog/product_data.dart';

class SearchResultsPage extends StatelessWidget {
  final List<ProductData> mostSearchedProducts;
  final List<String> searchHistory;
  final List<ProductData> searchedItems;

  SearchResultsPage({
    Key? key,
    required this.mostSearchedProducts,
    required this.searchHistory,
    required this.searchedItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        // Add any additional customization as needed
      ),
      body: ListView(
        children: [
          // Most Searched Products Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Most Searched Products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  children: mostSearchedProducts.map((product) {
                    return SearchResultsItem(title: product.title);
                  }).toList(),
                ),
              ],
            ),
          ),

          // Search History Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search History',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  children: searchHistory.map((historyItem) {
                    return SearchResultsItem(title: historyItem);
                  }).toList(),
                ),
              ],
            ),
          ),

          // Searched Items Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Searched Items',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  children: searchedItems.map((product) {
                    return SearchResultsItem(title: product.title);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
