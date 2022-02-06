import 'package:flutter/Material.dart';

class QuantityButton extends StatelessWidget {
  final int quantity;
  final void Function() onAdd;
  final void Function() onRemove;

  const QuantityButton({
    Key? key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                height: 64,
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 4,
            child: Container(
              height: 64,
              child: Center(
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: "Mirage",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: GestureDetector(
              onTap: onAdd,
              child: Container(
                height: 64,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
