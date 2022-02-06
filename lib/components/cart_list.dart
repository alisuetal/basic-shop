import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class CartList extends StatelessWidget {
  Function()? hide;
  CartList({Key? key, this.hide}) : super(key: key);

  void _selectProduct(BuildContext context, CartItem item) {
    Product product = Provider.of<ProductList>(context, listen: false)
        .items
        .where((element) => element.id == item.productId)
        .first;
    Navigator.of(context)
        .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final items = Provider.of<Cart>(context, listen: false).items;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cart",
              style: TextStyle(
                fontFamily: "Mirage",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => _selectProduct(context, items[index]),
                          child: Text(
                            items[index].quantity.toString() +
                                "x " +
                                items[index].title,
                            style: const TextStyle(
                              fontFamily: "Mirage",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Text(
                          "R\$ " +
                              (items[index].price * items[index].quantity)
                                  .toStringAsFixed(2),
                          style: const TextStyle(
                            fontFamily: "Mirage",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontFamily: "Mirage",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "R\$ " + cart.totalAmount.toStringAsFixed(2),
                  style: const TextStyle(
                    fontFamily: "Mirage",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            if (hide != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: hide,
                    child: const Text(
                      "Hide cart",
                      style: TextStyle(
                        fontFamily: "Mirage",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black38,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
