import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:profile_ibaza/features/home_ibaza/presentation/widgets/search.dart';
import '../../../../assets/constants/colors.dart';
import '../../../../assets/constants/icons.dart';
import '../../../catalog/discount_page.dart';
import '../../../catalog/product_data.dart';
import 'my_search_delegate.dart';


class CatalogScreen extends StatefulWidget {
  const CatalogScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late List<ProductData> allProducts;
  final List<ProductData> mostSearchedProducts = []; // Initialize this list with your data
  final List<String> searchHistory = []; // Initialize this list with your data

  @override
  void initState() {
    super.initState();
    // Initialize allProducts with your actual data
    allProducts = [
      ProductData(title: 'Product 1', definition: '...', price: '100'),
      ProductData(title: 'Product 2', definition: '...', price: '150'),
      // Add more products as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Katalog',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 116,
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SvgPicture.asset(AppIcons.catalog),
                        );
                      },
                    ),
                    const Gap(8),
                    const Text(
                      'Katalog',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: surveyColour,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(AppIcons.search, height: 20, width: 20),
                      onPressed: () async {
                        List<ProductData>? searchedItems = await showSearch(
                          context: context,
                          delegate: MySearchDelegate(
                            mostSearchedProducts: mostSearchedProducts,
                            searchHistory: searchHistory,
                            allProducts: allProducts,
                          ),
                        );
                        if (searchedItems!.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResultsPage(
                                mostSearchedProducts: mostSearchedProducts,
                                searchHistory: searchHistory,
                                searchedItems: searchedItems,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const Expanded(
                      child: TextField(
                        cursorColor: null,
                        decoration: InputDecoration(
                          hintText: 'Izlash ',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Gap(22),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: DiscountPage(products: allProducts),
    );
  }
}
