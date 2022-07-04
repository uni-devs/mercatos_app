import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../components/themes/mercatos_colors.dart';
import '../../../../../../components/themes/mercatos_text_styles.dart';
import '../../../../../../components/themes/mercatos_widget_styles.dart';
import '../../../../../../components/widgets/styled_button_widget.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return StyledButtonWidget(
      style: MercatosWidgetStyle.styled_button.copyWith(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(15.w),
            ),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.all(15.w),
        ),
        backgroundColor: MaterialStateProperty.all(
          MercatosColors.primary_color.withOpacity(0.05),
        ),
      ),
      onPressed: onTap,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Next",
              style: MercatosTextStyle.number_text.copyWith(
                color: MercatosColors.primary_color,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(
              Icons.arrow_forward_ios,
              color: MercatosColors.primary_color,
              size: 18.w,
            ),
          ],
        ),
      ),
    );
  }
}
