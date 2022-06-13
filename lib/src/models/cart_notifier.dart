import 'package:flutter/foundation.dart';
import 'package:simple_shopping/src/models/product.dart';

class CartNotifier extends ChangeNotifier {
  Map<String, int> cartProducts = {};
  Map<String, Product> cartProductMap = {};
  double totalAmount = 0;
  int totalItems = 0;
  int totalProducts = 0;

  void addProduct(Product product, int qty) {
    if (qty == 0) {
      remove(product);
      return;
    }
    cartProductMap[product.id] = product;
    int newQty = cartProducts[product.id] ?? 0;
    newQty += qty;
    cartProducts[product.id] = newQty;
    _calculateTotals();
    notifyListeners();
  }

  bool decreaseQty(Product product) {
    int qty = cartProducts[product.id] ?? 0;
    qty--;
    if (qty <= 0) {
      return false;
      // remove(product);
    }
    cartProducts[product.id] = qty;
    _calculateTotals();
    notifyListeners();
    return true;
  }

  void increaseQty(Product product) {
    cartProductMap[product.id] = product;
    int newQty = cartProducts[product.id] ?? 0;
    newQty++;
    cartProducts[product.id] = newQty;
    _calculateTotals();
    notifyListeners();
  }

  void remove(Product product) {
    cartProducts.remove(product.id);
    cartProductMap.remove(product.id);
    _calculateTotals();
    notifyListeners();
  }

  void clear() {
    cartProducts.clear();
    cartProductMap.clear();
    _calculateTotals();
    notifyListeners();
  }

  int totalProductItem(Product p) => cartProducts[p.id] ?? 0;

  Product? getProductById(String id) => cartProductMap[id];

  _calculateTotals() {
    totalProducts = cartProducts.length;
    totalItems = cartProducts.isEmpty
        ? 0
        : cartProducts.values.reduce((sum, element) => sum + element);
    totalAmount = 0;
    for (var key in cartProducts.keys) {
      if (cartProductMap.containsKey(key)) {
        totalAmount += cartProductMap[key]!.price * cartProducts[key]!;
      }
    }
  }
}
