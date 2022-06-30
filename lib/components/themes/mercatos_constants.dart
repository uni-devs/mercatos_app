import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class MercatosConstants {
  static final double horizontal_padding = 14.w;
  static final double vertical_padding = 14.h;

  static final double h1_font_size = 18.sm;
  static final double h2_font_size = 16.sm;
  static final double h3_font_size = 14.sm;
  static final double h4_font_size = 12.sm;

  static const double border_radius = 8.0;
  static String appUrl() {
    return Platform.isAndroid
        ? 'https://play.google.com/store/apps/details?id=com.miniclip.gunanddungeons'
        : 'https://itunes.apple.com/us/app/mercatos/id1498420000?ls=1&mt=8';
  }
}
