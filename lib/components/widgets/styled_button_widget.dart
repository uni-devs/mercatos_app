import 'package:flutter/material.dart';
import 'package:mercatos/components/themes/mercatos_widget_styles.dart';

class StyledButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final ButtonStyle? style;

  const StyledButtonWidget({
    Key? key,
    required this.child,
    this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? MercatosWidgetStyle.styled_button,
      child: Center(
        child: child,
      ),
    );
  }
}
