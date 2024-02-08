class ProductData {
  final String title;
  final String definition;
  final String? oldPrice;
  final String price;

  ProductData({
    required this.title,
    required this.definition,
    this.oldPrice,
    required this.price,
  });
}