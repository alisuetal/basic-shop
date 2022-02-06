import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/button_submit.dart';
import 'package:shop/components/quantity_button.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';

class FormQuantity extends StatefulWidget {
  final int quantity;
  final Product product;

  const FormQuantity({
    Key? key,
    required this.quantity,
    required this.product,
  }) : super(key: key);

  @override
  State<FormQuantity> createState() => _FormQuantityState(quantity: quantity);
}

class _FormQuantityState extends State<FormQuantity> {
  int quantity;

  _FormQuantityState({
    required this.quantity,
  });

  void _onAdd() {
    setState(() {
      quantity++;
    });
  }

  void _onRemove() {
    if (widget.quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  void _submitPurchase(Cart cart, BuildContext context) {
    cart.addItem(widget.product, quantity);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quantity",
          style: TextStyle(
            fontFamily: "Mirage",
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        QuantityButton(
          quantity: quantity,
          onAdd: _onAdd,
          onRemove: _onRemove,
        ),
        const SizedBox(
          height: 16,
        ),
        ButtonSubmit(
            onSubmit: () => _submitPurchase(cart, context),
            text:
                ("R\$ " + (quantity * widget.product.price).toStringAsFixed(2)),
            enabled: quantity > 0 ? true : false)
      ],
    );
  }
}
