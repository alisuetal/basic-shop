import 'package:flutter/Material.dart';
import 'package:shop/models/product.dart';

class HorizontalProduct extends StatelessWidget {
  final Product product;
  const HorizontalProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: "Mirage",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  Text(
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
    );
  }
}
