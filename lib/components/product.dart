// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/Material.dart';
import 'package:shop/data/favorite.dart';
import 'package:shop/models/product.dart';

import '../utils/app_routes.dart';

class ProductWidget extends StatefulWidget {
  final Product product;

  const ProductWidget(this.product);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  void _selectProduct(BuildContext context, Product product) {
    Navigator.of(context)
        .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product)
        .then((result) {
      setState(() {});
    });
  }

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
    _isFavorite = FavoriteProducts.checkProduct(widget.product);
    return GestureDetector(
      onTap: () => _selectProduct(context, widget.product),
      child: Container(
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                child: Image.network(
                  widget.product.imageUrl,
                  // width: double.infinity,
                  fit: BoxFit.fitWidth,
                  // height: 156,
                  alignment: Alignment.center,
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'R\$ ' + widget.product.price.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Mirage",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _setFavorite(widget.product),
                        child: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          widget.product.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontFamily: "Mirage",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          widget.product.description,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.06)),
      ),
    );
  }
}
