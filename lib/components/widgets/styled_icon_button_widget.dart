import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercatos/components/themes/mercatos_widget_styles.dart';

class StyledIconButton extends StatelessWidget {
  const StyledIconButton({Key? key, required this.icon, this.onPressed})
      : super(key: key);
  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: MercatosWidgetStyle.icon_button,
      child: SizedBox(
        height: 60.h,
        width: 30.w,
        child: FittedBox(
          child: icon,
        ),
      ),
    );
  }
}
