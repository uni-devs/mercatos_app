import 'package:flutter/material.dart';

class StyledTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const StyledTextButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
