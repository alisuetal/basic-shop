import 'package:flutter/material.dart';
import 'package:shop/components/app_bar.dart';
import 'package:shop/components/product_grid.dart';

class ProductsOverView extends StatefulWidget {
  final bool onlyFavorites;
  const ProductsOverView({Key? key, required this.onlyFavorites})
      : super(key: key);

  @override
  State<ProductsOverView> createState() => _ProductsOverViewState();
}

class _ProductsOverViewState extends State<ProductsOverView> {
  void _refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              const AppBarWidget(title: "Shop", backButton: false),
              ProductGrid(
                onlyFavorites: widget.onlyFavorites,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
