import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import '../utils/app_routes.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  void _selectProduct(BuildContext context, Product product) {
    Navigator.of(context)
        .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return GestureDetector(
      onTap: () => _selectProduct(context, product),
      child: Container(
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                child: Image.network(
                  product.imageUrl,
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
                          'R\$ ' + product.price.toString(),
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
                      Consumer<Product>(
                        builder: (context, product, _) => GestureDetector(
                          onTap: () => product.toggleFavorite(),
                          child: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          product.title,
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
                          product.description,
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
