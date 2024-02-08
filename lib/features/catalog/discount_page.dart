import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile_ibaza/features/catalog/product_data.dart';
import '../../assets/constants/colors.dart';
import '../../assets/constants/icons.dart';
import 'bottom_button.dart';
import 'liked_widget.dart';


class DiscountPage extends StatefulWidget {
  final List<ProductData> products;

  DiscountPage({Key? key, required this.products}) : super(key: key);

  @override
  _DiscountPageState createState() => _DiscountPageState();
}


class _DiscountPageState extends State<DiscountPage> {

  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  final List<ProductData> products = [
    ProductData(
      title: 'KNAUF',
      definition: 'Shtukaturka ROTBAND\n KNAUF',
      oldPrice: '184 000 UZS',
      price: '84 000 UZS',
    ),
    ProductData(
      title: 'Quelyd',
      definition: '“Quelyd” Gul qog‘ozlar uchun yelim',
      price: '84 000 UZS',
    ),
    ProductData(
      title: 'Matrix',
      definition: 'Matrix kesish uchun\n asbob',
      oldPrice: '184 000 UZS',
      price: '84 000 UZS',
    ),
    ProductData(
      title: 'MAPEI',
      definition: '“Ultracolor Plus”dan maxsus jamlanma',
      price: '41 500 UZS',
    ),
    ProductData(
      title: 'PUMA',
      definition: 'Krasovki. Puma Ferrari Drift Cat 5 Ultra.',
      oldPrice: '184 000 UZS',
      price: '84 000 UZS',
    ),
    ProductData(
      title: 'Snegurochka',
      definition: '“Snegurochka” A4 500\n varaq',
      price: '84 000 UZS',
    ),
  ];
  List<ProductData> getSearchResults(String query) {
    return widget.products
        .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Ushbu takliflarga e\'tibor qarating',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 0.58,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: 4,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPageIndex = page;
                          });
                        },
                        itemBuilder: (BuildContext context, int pageIndex) {
                          return Stack(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/images/image${index + 1}.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Star(), // Add the Star widget
                            ],
                          );
                        },
                      ),
                    ),
                    buildPageIndicator(),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: containerBackground,
                          height: 147,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: titleColor),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  product.definition,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: definitionGrey),
                                ),
                                if (product.oldPrice != null)
                                  Text(
                                    product.oldPrice!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: oldPrice),
                                  ),
                                Text(
                                  product.price,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: price),
                                ),
                                if (product.oldPrice == null)
                                  SizedBox(height: 15),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.cart),
                                    SizedBox(width: 25),
                                    SvgPicture.asset(AppIcons.heart),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const BottomButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildPageIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
              (index) => Container(
            width: 8,
            height: 8,
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == _currentPageIndex ? Colors.yellow : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
