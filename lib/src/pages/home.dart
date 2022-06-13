import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/src/components/app_bar.dart';
import 'package:simple_shopping/src/components/bottom_navigation.dart';
import 'package:simple_shopping/src/components/custom_drawer.dart';
import 'package:simple_shopping/src/components/product_filters.dart';
import 'package:simple_shopping/src/components/single_product.dart';
import 'package:simple_shopping/src/models/product_list.dart';
import 'package:simple_shopping/src/utils/sample_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductList>().reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomAppBar(
                        title: widget.title,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ProductFilters(),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Consumer<ProductList>(
                          builder: (_, productListProvider, __) {
                            return GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  productListProvider.totalFilteredProducts,
                              itemBuilder: (BuildContext context, int index) {
                                return SingleProduct(
                                  product:
                                      productListProvider.productList[index],
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                crossAxisCount: 2,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const CustomBottomNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}
