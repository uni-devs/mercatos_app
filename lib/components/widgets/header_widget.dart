import 'package:flutter/material.dart';
import 'package:mercatos/components/themes/mercatos_text_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: MercatosTextStyle.h1,
        ),
        Text(
          subtitle ?? '',
          style: MercatosTextStyle.h4,
        ),
      ],
    );
  }
}
