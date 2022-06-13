import 'package:flutter/foundation.dart';
import 'package:simple_shopping/src/models/product.dart';
import 'package:simple_shopping/src/utils/sample_data.dart';

class ProductList extends ChangeNotifier {
  List<Product> productList = [];
  Map<String, Product> productMap = {};

  int get totalProducts => SampleData.allProducts.length;
  int get totalFilteredProducts => productList.length;

  void reset() {
    productList.clear();
    productList.addAll(SampleData.allProducts);
    for (var p in productList) {
      productMap[p.id] = p;
    }
    notifyListeners();
  }

  void filter(String? filter) {
    productList.clear();
    if(filter == null || filter.isEmpty) {
      reset();
      notifyListeners();
      return;
    }
    for (var i = 0; i < SampleData.allProducts.length; i++) {
      Product p = SampleData.allProducts[i];
      if (p.tags.contains(filter)) {
        productList.add(p);
      }
    }
    notifyListeners();
  }
}
