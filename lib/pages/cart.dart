import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_bar.dart';
import 'package:shop/components/button_submit.dart';
import 'package:shop/components/cart_list.dart';
import 'package:shop/components/horizontal_product_cart.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderList>(context);
    final cart = Provider.of<Cart>(context);
    final cartItems = cart.items;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    const AppBarWidget(title: "Cart", backButton: false),
                    CartList(),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Product product = Provider.of<ProductList>(
                            context,
                            listen: false,
                          )
                              .items
                              .where((element) =>
                                  element.id == cartItems[index].productId)
                              .first;
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: HorizontalProductCart(
                                product: product,
                                quantity: cartItems[index].quantity),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonSubmit(
              onSubmit: () {
                orderList.addOrder(cart);
                cart.clear();
              },
              text: "Checkout",
              enabled: cartItems.isNotEmpty,
            ),
          )
        ],
      ),
    );
  }
}
