import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercatos/components/themes/mercatos_text_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    this.title,
    this.titleNormal,
    this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? titleNormal;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title ?? '',
              style: MercatosTextStyle.h1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text(
                titleNormal ?? '',
                style: MercatosTextStyle.h1.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        Text(
          subtitle ?? '',
          style: MercatosTextStyle.h4,
        ),
      ],
    );
  }
}
