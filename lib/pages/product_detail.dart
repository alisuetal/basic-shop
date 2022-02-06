import 'package:flutter/material.dart';
import 'package:shop/data/favorite.dart';
import 'package:shop/models/product.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _isFavorite = false;

  void _setFavorite(Product product) {
    if (_isFavorite) {
      setState(() {
        FavoriteProducts.removeProduct(product);
      });
    } else {
      setState(() {
        FavoriteProducts.addProduct(product);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;
    _isFavorite = FavoriteProducts.checkProduct(product);

    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  // AppBarWidget(title: product.title, backButton: true),
                  Stack(
                    children: [
                      Image.network(
                        product.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 400,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 376,
                        ),
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 24.0,
                              left: 20,
                              right: 20,
                              bottom: 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontFamily: "Mirage",
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'R\$ ' + product.price.toString(),
                                  style: TextStyle(
                                    fontFamily: "Mirage",
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  product.description,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            color: Color(0xFFEBEBEB),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: const Icon(
                                  Icons.arrow_back_outlined,
                                  color: Colors.white,
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _setFavorite(product),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  _isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.white,
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 56,
                      width: 125,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.shopping_bag,
                              size: 24,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Shop now",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Mirage",
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
