import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/src/components/base.dart';
import 'package:simple_shopping/src/components/cart_app_bar.dart';
import 'package:simple_shopping/src/components/confirmation_dialog.dart';
import 'package:simple_shopping/src/models/cart_notifier.dart';
import 'package:simple_shopping/src/models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.width;

    return BaseWidget(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            const CustomCartAppBar(title: ""),
            Center(
              child: Hero(
                tag: 'product_image_hero_${product.id}',
                child: Image.asset(
                  product.image,
                  height: fullHeight / 2,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'xproduct_name_hero_${product.id}',
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Hero(
                          tag: 'xproduct_price_hero_${product.id}',
                          child: Text(
                            'Rs.${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 50,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            children: [
                              InkWell(
                                onTap: () {
                                  bool res = context
                                      .read<CartNotifier>()
                                      .decreaseQty(product);
                                  if (!res) _confirmDelete(context);
                                },
                                child: const Icon(Icons.remove),
                              ),
                              Text(context
                                  .watch<CartNotifier>()
                                  .totalProductItem(product)
                                  .toString()),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<CartNotifier>()
                                      .increaseQty(product);
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return ConfirmationDialog(
          message: "Are you sure you want to remove this Product from Cart?",
          onConfirm: () {
            context.read<CartNotifier>().remove(product);
          },
        );
      },
    );
  }
}
