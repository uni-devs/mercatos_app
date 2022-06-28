import 'package:flutter/material.dart';
import 'package:mercatos/components/themes/mercatos_colors.dart';
import 'package:mercatos/components/themes/mercatos_constants.dart';
import 'package:mercatos/components/themes/mercatos_text_styles.dart';

class StyledDivider extends StatelessWidget {
  const StyledDivider({Key? key, this.text, this.color}) : super(key: key);

  final String? text;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: color ?? MercatosColors.divider_color,
          ),
        ),
        if (text != null)
          Expanded(
            flex: text!.length > 30 ? 10 : 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MercatosConstants.horizontal_padding,
              ),
              child: Text(
                text!,
                style: MercatosTextStyle.divider.copyWith(
                  color: color,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        Expanded(
          child: Divider(
            color: color ?? MercatosColors.divider_color,
          ),
        ),
      ],
    );
  }
}
