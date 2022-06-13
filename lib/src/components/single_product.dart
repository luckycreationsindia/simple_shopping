import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/src/models/cart_notifier.dart';
import 'package:simple_shopping/src/models/product.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(product.image),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(product.name),
          Row(
            children: [
              Text("Rs.${product.price.toStringAsFixed(2)}"),
              const Spacer(),
              Text(context.watch<CartNotifier>().totalProductItem(product).toString()),
              InkWell(
                onTap: () {
                  context.read<CartNotifier>().increaseQty(product);
                },
                child: const Icon(Icons.add_shopping_cart),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
