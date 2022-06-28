import 'package:flutter/material.dart';
import 'package:mercatos/components/themes/mercatos_widget_styles.dart';

class StyledButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const StyledButtonWidget({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: MercatosWidgetStyle.styled_button,
      child: Center(
        child: child,
      ),
    );
  }
}
