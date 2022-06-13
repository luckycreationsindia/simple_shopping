import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/src/components/CustomButton.dart';
import 'package:simple_shopping/src/components/alert_dialog.dart';
import 'package:simple_shopping/src/components/cart_app_bar.dart';
import 'package:simple_shopping/src/components/cart_single_product.dart';
import 'package:simple_shopping/src/models/cart_notifier.dart';
import 'package:simple_shopping/src/models/product.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              const CustomCartAppBar(title: "My Cart"),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<CartNotifier>(
                  builder: (context, providerData, _) {
                    List<Product> productList =
                        providerData.cartProductMap.values.toList();
                    if (productList.isEmpty) {
                      return const Center(
                        child: Text("No Items in Cart"),
                      );
                    }
                    return LiveList.options(
                      options: const LiveOptions(
                        showItemInterval: Duration(milliseconds: 50),
                        showItemDuration: Duration(milliseconds: 200),
                        visibleFraction: 0.05,
                        reAnimateOnVisibility: true,
                      ),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: context.watch<CartNotifier>().totalProducts,
                      itemBuilder: (BuildContext context, int index,
                          Animation<double> animation) {
                        return FadeTransition(
                          opacity: Tween<double>(
                            begin: 0,
                            end: 1,
                          ).animate(animation),
                          // And slide transition
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset.zero,
                              end: const Offset(0, -0.1),
                            ).animate(animation),
                            // Paste you Widget
                            child: CartSingleProduct(
                              product: productList[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total Amount: Rs.",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: context
                              .watch<CartNotifier>()
                              .totalAmount
                              .toStringAsFixed(2),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    text: "Checkout",
                    onPressed: () {
                      int totalItems = context.read<CartNotifier>().totalItems;
                      if (totalItems > 0) {
                        context.push("/payment");
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return const CustomAlertDialog(
                              title: "Oops...",
                              message: "Cart is Empty",
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
