import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class HorizontalProductCart extends StatelessWidget {
  final int quantity;
  final Product product;

  const HorizontalProductCart({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  void _selectProduct(BuildContext context, Product product) {
    Navigator.of(context)
        .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return GestureDetector(
      onTap: () => _selectProduct(context, product),
      child: Container(
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Image.network(
                    product.imageUrl,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quantity.toString() + "x " + product.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontFamily: "Mirage",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                        Text(
                          'R\$ ' + (product.price * quantity).toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Mirage",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => cart.removeItem(product.id),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Icon(Icons.delete),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
        ),
      ),
    );
  }
}
