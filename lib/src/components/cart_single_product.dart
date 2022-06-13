import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/src/components/confirmation_dialog.dart';
import 'package:simple_shopping/src/models/cart_notifier.dart';
import 'package:simple_shopping/src/models/product.dart';

class CartSingleProduct extends StatelessWidget {
  const CartSingleProduct({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 20, left: 50, right: 50),
      // margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Container(
            height: 150.0,
            width: 150.0,
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
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(product.name),
                Text("Rs.${product.price.toStringAsFixed(2)}"),
                const SizedBox(height: 5),
                SizedBox(
                  height: 50,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      InkWell(
                        onTap: () {
                          bool res =
                              context.read<CartNotifier>().decreaseQty(product);
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
                          context.read<CartNotifier>().increaseQty(product);
                        },
                        child: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () => _confirmDelete(context),
                        icon: const Icon(
                          Icons.delete,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
