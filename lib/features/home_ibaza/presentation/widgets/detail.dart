import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productTitle;

  ProductDetailsPage({required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productTitle),
      ),
      body: Center(
        child: Text('Product Details for $productTitle'),
      ),
    );
  }
}
