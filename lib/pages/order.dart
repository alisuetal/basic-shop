import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_bar.dart';
import 'package:shop/components/order_list.dart';
import 'package:shop/models/order_list.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderList>(context).items;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    const AppBarWidget(title: "Orders", backButton: false),
                    orderList.isNotEmpty
                        ? MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                              itemCount: orderList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: OrderListWidget(
                                    order: orderList[index],
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox(
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Nothing here yet.",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Mirage",
                                      color: Colors.black26),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
