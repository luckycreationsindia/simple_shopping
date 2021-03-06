import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          InkWell(
            onTap: () {
              context.push("/product/${product.id}");
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Hero(
                tag: 'product_image_hero_${product.id}',
                child: Image.asset(
                  product.image,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Hero(
            tag: 'product_name_hero_${product.id}',
            child: Text(product.name),
          ),
          Row(
            children: [
              Hero(
                tag: 'product_price_hero_${product.id}',
                child: Text("Rs.${product.price.toStringAsFixed(2)}"),
              ),
              const Spacer(),
              Text(context
                  .watch<CartNotifier>()
                  .totalProductItem(product)
                  .toString()),
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
