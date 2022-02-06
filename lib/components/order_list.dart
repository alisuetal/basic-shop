import 'package:flutter/material.dart';
import 'package:shop/models/order.dart';

class OrderListWidget extends StatelessWidget {
  final Order order;
  const OrderListWidget({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              "Order",
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
                itemCount: order.products.length,
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
                        Text(
                          order.products[index].quantity.toString() +
                              "x " +
                              order.products[index].title,
                          style: const TextStyle(
                            fontFamily: "Mirage",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "R\$ " +
                              (order.products[index].price *
                                      order.products[index].quantity)
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
                  "R\$ " + order.total.toStringAsFixed(2),
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
          ],
        ),
      ),
    );
  }
}
