import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../components/themes/mercatos_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 5,
      effect: ExpandingDotsEffect(
        spacing: 4.h,
        activeDotColor: MercatosColors.primary_color,
        dotColor: MercatosColors.primary_color.withOpacity(0.2),
        dotHeight: 6.h,
        dotWidth: 6.h,
      ),
    );
  }
}
