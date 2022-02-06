import 'package:flutter/material.dart';
import 'package:shop/components/app_bar.dart';
import 'package:shop/components/product.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsOverView extends StatelessWidget {
  const ProductsOverView({Key? key}) : super(key: key);

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
              MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                itemCount: dummyData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductWidget(dummyData[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
