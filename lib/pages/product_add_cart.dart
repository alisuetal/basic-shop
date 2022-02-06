import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_bar.dart';
import 'package:shop/components/cart_list.dart';
import 'package:shop/components/horizontal_product.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import '../components/form_quantity.dart';

class CartAddProduct extends StatefulWidget {
  const CartAddProduct({Key? key}) : super(key: key);

  @override
  State<CartAddProduct> createState() => _CartAddProductState();
}

class _CartAddProductState extends State<CartAddProduct> {
  bool showCart = false;

  void _toggleCart() {
    setState(() {
      showCart = !showCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    final cart = Provider.of<Cart>(context, listen: false);
    final cartItems = cart.items;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Scaffold(
              backgroundColor: const Color(0xFFFFFFFF),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const AppBarWidget(
                        title: "Add to cart",
                        backButton: true,
                      ),
                      HorizontalProduct(product: product),
                      const SizedBox(
                        height: 16,
                      ),
                      if (cartItems.isNotEmpty && !showCart)
                        GestureDetector(
                          onTap: () => _toggleCart(),
                          child: const Text(
                            "See cart",
                            style: TextStyle(
                              fontFamily: "Mirage",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black38,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      if (showCart)
                        CartList(
                          hide: () => _toggleCart(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FormQuantity(
                  quantity: cart.itemQuantity(product) == 0
                      ? 1
                      : cart.itemQuantity(product),
                  product: product),
            ),
          ),
        ],
      ),
    );
  }
}
