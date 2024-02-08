import 'package:flutter/material.dart';
import '../../../catalog/product_data.dart';
import 'detail.dart';


class SearchResultsItem extends StatelessWidget {
  final String title;

  SearchResultsItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(productTitle: title),
          ),
        );
      },
      // Handle item tap, you can navigate to the product details page or perform any other action.
    );
  }
}
