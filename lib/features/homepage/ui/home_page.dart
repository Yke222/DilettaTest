import 'package:diletta_test/core/extensions/context_extensions.dart';
import 'package:diletta_test/features/homepage/model/data/product.dart';
import 'package:diletta_test/features/homepage/route/home_path.dart';
import 'package:diletta_test/features/homepage/ui/home_categories.dart';
import 'package:diletta_test/features/homepage/ui/home_products.dart';
import 'package:diletta_test/features/homepage/viewmodel/home_vm.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/di/setup_locator.dart';
import '../../../widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _vm = getIt.get<HomeViewModel>();

  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    initItems();
  }

  void initItems() {
    _vm.fetchProducts();
    _vm.fetchCategories();
    setFirstCategory();
  }

  @override
  void dispose() {
    super.dispose();
    _vm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: ValueListenableBuilder<bool>(
              valueListenable: _vm.isLoading,
              builder: (context, isLoading, child) {
                return isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _body;
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(HomePath.wishlist.path);
            },
            backgroundColor: Colors.black,
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget get _body => ValueListenableBuilder<bool>(
        valueListenable: _vm.error,
        builder: (_, onError, child) {
          return onError
              ? _error
              : Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CustomText(
                          description: context.appStrings.categories,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 80, child: _categories),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CustomText(
                          description: context.appStrings.products,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: _products),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
        },
      );

  Widget get _categories => ValueListenableBuilder<List<String>>(
        valueListenable: _vm.categories,
        builder: (context, categories, _) {
          return categories.isEmpty
              ? Container()
              : HomeCategories(
                  categories: categories,
                  onItemSelected: (item) => onCategorySelected(item),
                  selectedCategory: selectedCategory,
                );
        },
      );

  Widget get _products => ValueListenableBuilder<List<Product>>(
        valueListenable: _vm.products,
        builder: (context, products, _) {
          return products.isEmpty
              ? Container()
              : HomeProducts(products: products, onItemSelected: (item) => onProductSelected(item));
        },
      );

  Widget get _error => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: context.appStrings.problem_to_fetch_data,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: context.appStrings.try_again,
                    style: TextStyle(
                      color: Color(0xFF1B51DC),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        initItems();
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
    _vm.filterItemsPerCategory(selectedCategory);
  }

  void onProductSelected(Product item) {
    Navigator.of(context).pushNamed(HomePath.product.path, arguments: item);
  }

  void setFirstCategory() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedCategory = context.appStrings.all;
      });
    });
  }
}
