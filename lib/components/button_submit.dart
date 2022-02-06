import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  final void Function() onSubmit;
  final String text;
  final bool enabled;

  const ButtonSubmit(
      {Key? key,
      required this.onSubmit,
      required this.text,
      required this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSubmit,
      child: Container(
        width: double.infinity,
        height: 64,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Mirage",
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: enabled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary.withOpacity(0.4),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
