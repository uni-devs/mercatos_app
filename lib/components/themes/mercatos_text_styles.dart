import 'package:flutter/material.dart';
import 'package:mercatos/components/themes/mercatos_colors.dart';
import 'package:mercatos/components/themes/mercatos_constants.dart';

abstract class MercatosTextStyle {
  static TextStyle get h1 => TextStyle(
        fontSize: MercatosConstants.h1_font_size,
        fontWeight: FontWeight.w600,
        color: MercatosColors.primary_color,
      );
  static TextStyle get h4 => TextStyle(
        fontSize: MercatosConstants.h4_font_size,
        fontWeight: FontWeight.w500,
        color: MercatosColors.grey_color,
      );

  static TextStyle get hint => TextStyle(
        fontSize: MercatosConstants.h3_font_size,
        fontWeight: FontWeight.w600,
        color: MercatosColors.hint_search_color,
      );

  static TextStyle get divider => TextStyle(
        fontSize: MercatosConstants.h4_font_size,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.8,
        color: MercatosColors.divider_color,
      );

  // static TextStyle get titleBarStyle => TextStyle(
  //       fontSize: 18.sm,
  //       fontWeight: FontWeight.w600,
  //       color: KargoColors.h1_font_color,
  //     );
  // static TextStyle get h4Style => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w600,
  //       color: const Color(0xff13192B),
  //     );

  // static TextStyle get submitStyle => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w500,
  //       color: Colors.white,
  //     );
  // static TextStyle get titleStyle => TextStyle(
  //       fontSize: 16.sm,
  //       fontWeight: FontWeight.w600,
  //       color: KargoColors.disabled_icon_color,
  //     );

  // static TextStyle get logoutStyle => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w500,
  //       color: KargoColors.primary_color,
  //     );

  // static TextStyle get h2Style => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w400,
  //       color: KargoColors.h2_font_color,
  //     );

  // static TextStyle get greenStyle => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w500,
  //       color: KargoColors.sub_color,
  //     );

  // static TextStyle get h3Style => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w400,
  //       color: KargoColors.h3_font_color,
  //     );
  // static TextStyle get h2Style_Italic => h2Style.copyWith(
  //       fontStyle: FontStyle.italic,
  //     );

  // static TextStyle get hintStyle => TextStyle(
  //       color: KargoColors.hint_color,
  //       fontSize: 14.sm,
  //     );

  // static TextStyle get errorStyle => TextStyle(
  //       color: KargoColors.error_color,
  //       fontSize: 12.sm,
  //     );

  // static BorderSide get border_side => const BorderSide(
  //       color: KargoColors.border_color,
  //       width: 1.5,
  //     );

  // static OutlineInputBorder get input_border => OutlineInputBorder(
  //       borderSide: border_side,
  //       borderRadius: const BorderRadius.all(
  //         Radius.circular(KargoConstantsUI.border_radius),
  //       ),
  //     );

  // static InputDecoration get input_decoration => InputDecoration(
  //       hintStyle: TextStyle(
  //         color: KargoColors.hint_color,
  //         fontSize: 14.sm,
  //       ),
  //       enabledBorder: input_border,
  //       border: input_border.copyWith(borderSide: null),
  //     );

  // static InputDecoration get date_birth_input_decoration => InputDecoration(
  //       hintStyle: TextStyle(
  //         color: KargoColors.hint_color,
  //         fontSize: 14.sm,
  //       ),
  //       border: input_border.copyWith(
  //         borderRadius: const BorderRadius.horizontal(
  //           left: Radius.circular(KargoConstantsUI.border_radius),
  //         ),
  //       ),
  //       enabledBorder: input_border.copyWith(
  //         borderSide: border_side,
  //         borderRadius: const BorderRadius.horizontal(
  //           left: Radius.circular(KargoConstantsUI.border_radius),
  //         ),
  //       ),
  //     );

  // static ButtonStyle get submit_button_style => ElevatedButton.styleFrom(
  //       primary: KargoColors.primary_color,
  //       onPrimary: Colors.white.withOpacity(0.3),
  //       elevation: 0.0,
  //       shadowColor: KargoColors.primary_color.withOpacity(0.5),
  //       padding: const EdgeInsets.all(20),
  //       shape: RoundedRectangleBorder(
  //         side: KargoStyle.border_side,
  //         borderRadius: const BorderRadius.all(
  //             Radius.circular(KargoConstantsUI.border_radius)),
  //       ),
  //     );

  // static ButtonStyle get select_button_style => ElevatedButton.styleFrom(
  //       primary: Colors.white,
  //       onPrimary: KargoColors.primary_color,
  //       elevation: 0.0,
  //       shadowColor: KargoColors.primary_color.withOpacity(0.5),
  //       padding: const EdgeInsets.all(20),
  //       shape: const RoundedRectangleBorder(
  //         borderRadius:
  //             BorderRadius.all(Radius.circular(KargoConstantsUI.border_radius)),
  //       ),
  //     );

  // static ButtonStyle get icon_button_style => ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.all(0.0),
  //       shape: const CircleBorder(
  //         side: BorderSide(
  //           color: KargoColors.border_color,
  //           width: 1.0,
  //         ),
  //       ),
  //       onPrimary: KargoColors.primary_color,
  //       primary: Colors.white,
  //       elevation: 0.0,
  //       shadowColor: KargoColors.primary_color.withOpacity(0.2),
  //       onSurface: KargoColors.primary_color.withOpacity(0.2),
  //     );

  // static ButtonStyle get bottom_button_style => ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.all(0.0),
  //       shape: const CircleBorder(),
  //       onPrimary: KargoColors.primary_color,
  //       primary: Colors.white,
  //       elevation: 0.0,
  //       shadowColor: KargoColors.primary_color.withOpacity(0.2),
  //       onSurface: KargoColors.primary_color.withOpacity(0.2),
  //       minimumSize: const Size.fromRadius(25),
  //     );

  // static InputDecoration get inc_dec_decoration => InputDecoration(
  //       hintStyle: TextStyle(
  //         color: KargoColors.hint_color,
  //         fontSize: 14.sm,
  //       ),
  //       contentPadding: EdgeInsets.zero,
  //       enabledBorder: const OutlineInputBorder(
  //           borderSide: BorderSide(
  //         color: KargoColors.border_color,
  //         width: 0.2,
  //         style: BorderStyle.solid,
  //       )),
  //       border: const OutlineInputBorder(),
  //     );
  // static ButtonStyle get dec_button_style => ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.all(0.0),
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.horizontal(
  //             left: Radius.circular(KargoConstantsUI.border_radius)),
  //       ),
  //       onPrimary: KargoColors.primary_color,
  //       primary: KargoColors.primary_color.withOpacity(0.1),
  //       elevation: 0.0,
  //       shadowColor: KargoColors.primary_color.withOpacity(0.2),
  //       onSurface: Colors.white,
  //       minimumSize: const Size.fromRadius(25),
  //     );

  // static ButtonStyle get inc_button_style => ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.all(0.0),
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.horizontal(
  //             right: Radius.circular(KargoConstantsUI.border_radius)),
  //       ),
  //       onPrimary: Colors.white,
  //       primary: KargoColors.primary_color,
  //       elevation: 0.0,
  //       shadowColor: KargoColors.primary_color.withOpacity(0.2),
  //       onSurface: Colors.white,
  //       minimumSize: const Size.fromRadius(25),
  //     );

  // static ButtonStyle get profile_button_style => ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.all(0.0),
  //       shape: const RoundedRectangleBorder(
  //           side: BorderSide(
  //             color: KargoColors.border_color,
  //             width: 1.0,
  //           ),
  //           borderRadius: BorderRadius.all(Radius.circular(15))),
  //       onPrimary: KargoColors.primary_color,
  //       primary: Colors.white,
  //       elevation: 0.0,
  //       shadowColor: KargoColors.primary_color.withOpacity(0.2),
  //       onSurface: KargoColors.primary_color.withOpacity(0.2),
  //     );

  // static ButtonStyle get list_tile_button_style => ElevatedButton.styleFrom(
  //       padding: EdgeInsets.all(15.r),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15.0.r),
  //       ),
  //       onPrimary: KargoColors.sub_color.withOpacity(0.3),
  //       primary: KargoColors.border_color,
  //       elevation: 0.0,
  //       shadowColor: KargoColors.sub_color,
  //     );

  // static BoxDecoration get box_decoration => BoxDecoration(
  //       border: Border.all(width: 1.5, color: KargoColors.border_color),
  //       borderRadius: const BorderRadius.all(
  //         Radius.circular(KargoConstantsUI.border_radius),
  //       ),
  //       /* color: Colors.white,
  //       boxShadow: const [
  //         BoxShadow(
  //           color: Colors.black12,
  //           blurRadius: 5,
  //           spreadRadius: 1,
  //           offset: Offset(0, 0),
  //         ),
  //       ], */
  //     );

  // static BoxDecoration get box_decoration_error =>
  //     KargoStyle.box_decoration.copyWith(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: KargoColors.primary_color.withOpacity(0.1),
  //           blurRadius: 9,
  //           spreadRadius: 5,
  //           offset: const Offset(0, 3),
  //         )
  //       ],
  //     );

  // static BoxDecoration get box_decoration_true =>
  //     KargoStyle.box_decoration.copyWith(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: KargoColors.sub_color.withOpacity(0.1),
  //           blurRadius: 9,
  //           spreadRadius: 5,
  //           offset: const Offset(0, 3),
  //         )
  //       ],
  //     );

  // static BoxDecoration get selection_box_decoration => const BoxDecoration(
  //     borderRadius: BorderRadius.all(
  //       Radius.circular(KargoConstantsUI.border_radius),
  //     ),
  //     color: KargoColors.border_color);
}
