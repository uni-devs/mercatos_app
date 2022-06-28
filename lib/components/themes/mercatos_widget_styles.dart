import 'package:flutter/material.dart';
import 'package:mercatos/components/themes/mercatos_colors.dart';
import 'package:mercatos/components/themes/mercatos_constants.dart';
import 'package:mercatos/components/themes/mercatos_text_styles.dart';

abstract class MercatosWidgetStyle {
  static InputDecoration get input_decoration => InputDecoration(
        hintStyle: MercatosTextStyle.hint,
        fillColor: MercatosColors.text_filed_filled_color,
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(MercatosConstants.border_radius),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(MercatosConstants.border_radius),
        ),
      );

  static ButtonStyle get styled_button => ElevatedButton.styleFrom(
        primary: MercatosColors.primary_color,
        onPrimary: Colors.white,
        elevation: 0.0,
        shadowColor: MercatosColors.primary_color.withOpacity(0.5),
        padding: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(MercatosConstants.border_radius),
          ),
        ),
      );

  static ButtonStyle get icon_button => ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        onPrimary: MercatosColors.primary_color,
        primary: MercatosColors.icon_button_color,
        elevation: 4.0,
        shadowColor: MercatosColors.primary_color.withOpacity(0.2),
        onSurface: MercatosColors.primary_color.withOpacity(0.2),
      );
  // static TextStyle get h1Style => TextStyle(
  //       fontSize: 24.sm,
  //       fontWeight: FontWeight.w600,
  //       color: MercatosColors.h1_font_color,
  //     );

  // static TextStyle get titleBarStyle => TextStyle(
  //       fontSize: 18.sm,
  //       fontWeight: FontWeight.w600,
  //       color: MercatosColors.h1_font_color,
  //     );
  // static TextStyle get h4Style => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w600,
  //       color: const Color(0xff13192B),
  //     );
  // static TextStyle get h4Style_small => TextStyle(
  //       fontSize: 12.sm,
  //       fontWeight: FontWeight.w600,
  //       color: MercatosColors.hint_search_color,
  //     );

  // static TextStyle get submitStyle => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w500,
  //       color: Colors.white,
  //     );
  // static TextStyle get titleStyle => TextStyle(
  //       fontSize: 16.sm,
  //       fontWeight: FontWeight.w600,
  //       color: MercatosColors.disabled_icon_color,
  //     );

  // static TextStyle get logoutStyle => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w500,
  //       color: MercatosColors.primary_color,
  //     );

  // static TextStyle get h2Style => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w400,
  //       color: MercatosColors.h2_font_color,
  //     );

  // static TextStyle get greenStyle => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w500,
  //       color: MercatosColors.sub_color,
  //     );

  // static TextStyle get h3Style => TextStyle(
  //       fontSize: 14.sm,
  //       fontWeight: FontWeight.w400,
  //       color: MercatosColors.h3_font_color,
  //     );
  // static TextStyle get h2Style_Italic => h2Style.copyWith(
  //       fontStyle: FontStyle.italic,
  //     );

  // static TextStyle get hintStyle => TextStyle(
  //       color: MercatosColors.hint_color,
  //       fontSize: 14.sm,
  //     );

  // static TextStyle get errorStyle => TextStyle(
  //       color: MercatosColors.error_color,
  //       fontSize: 12.sm,
  //     );

  // static BorderSide get border_side => const BorderSide(
  //       color: MercatosColors.border_color,
  //       width: 1.5,
  //     );

  // static OutlineInputBorder get input_border => OutlineInputBorder(
  //       borderSide: border_side,
  //       borderRadius: const BorderRadius.all(
  //         Radius.circular(MercatosConstants.border_radius),
  //       ),
  //     );

  // static InputDecoration get input_decoration => InputDecoration(
  //       hintStyle: TextStyle(
  //         color: MercatosColors.hint_color,
  //         fontSize: 14.sm,
  //       ),
  //       enabledBorder: input_border,
  //       border: input_border.copyWith(borderSide: null),
  //     );

  // static InputDecoration get date_birth_input_decoration => InputDecoration(
  //       hintStyle: TextStyle(
  //         color: MercatosColors.hint_color,
  //         fontSize: 14.sm,
  //       ),
  //       border: input_border.copyWith(
  //         borderRadius: const BorderRadius.horizontal(
  //           left: Radius.circular(MercatosConstants.border_radius),
  //         ),
  //       ),
  //       enabledBorder: input_border.copyWith(
  //         borderSide: border_side,
  //         borderRadius: const BorderRadius.horizontal(
  //           left: Radius.circular(MercatosConstants.border_radius),
  //         ),
  //       ),
  //     );

  // static ButtonStyle get select_button_style => ElevatedButton.styleFrom(
  //       primary: Colors.white,
  //       onPrimary: MercatosColors.primary_color,
  //       elevation: 0.0,
  //       shadowColor: MercatosColors.primary_color.withOpacity(0.5),
  //       padding: const EdgeInsets.all(20),
  //       shape: const RoundedRectangleBorder(
  //         borderRadius:
  //             BorderRadius.all(Radius.circular(MercatosConstants.border_radius)),
  //       ),
  //     );

  // static ButtonStyle get bottom_button_style => ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.all(0.0),
  //       shape: const CircleBorder(),
  //       onPrimary: MercatosColors.primary_color,
  //       primary: Colors.white,
  //       elevation: 0.0,
  //       shadowColor: MercatosColors.primary_color.withOpacity(0.2),
  //       onSurface: MercatosColors.primary_color.withOpacity(0.2),
  //       minimumSize: const Size.fromRadius(25),
  //     );

  // static InputDecoration get inc_dec_decoration => InputDecoration(
  //       hintStyle: TextStyle(
  //         color: MercatosColors.hint_color,
  //         fontSize: 14.sm,
  //       ),
  //       contentPadding: EdgeInsets.zero,
  //       enabledBorder: const OutlineInputBorder(
  //           borderSide: BorderSide(
  //         color: MercatosColors.border_color,
  //         width: 0.2,
  //         style: BorderStyle.solid,
  //       )),
  //       border: const OutlineInputBorder(),
  //     );
  // static ButtonStyle get dec_button_style => ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.all(0.0),
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.horizontal(
  //             left: Radius.circular(MercatosConstants.border_radius)),
  //       ),
  //       onPrimary: MercatosColors.primary_color,
  //       primary: MercatosColors.primary_color.withOpacity(0.1),
  //       elevation: 0.0,
  //       shadowColor: MercatosColors.primary_color.withOpacity(0.2),
  //       onSurface: Colors.white,
  //       minimumSize: const Size.fromRadius(25),
  //     );

  // static ButtonStyle get inc_button_style => ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.all(0.0),
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.horizontal(
  //             right: Radius.circular(MercatosConstants.border_radius)),
  //       ),
  //       onPrimary: Colors.white,
  //       primary: MercatosColors.primary_color,
  //       elevation: 0.0,
  //       shadowColor: MercatosColors.primary_color.withOpacity(0.2),
  //       onSurface: Colors.white,
  //       minimumSize: const Size.fromRadius(25),
  //     );

  // static ButtonStyle get profile_button_style => ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.all(0.0),
  //       shape: const RoundedRectangleBorder(
  //           side: BorderSide(
  //             color: MercatosColors.border_color,
  //             width: 1.0,
  //           ),
  //           borderRadius: BorderRadius.all(Radius.circular(15))),
  //       onPrimary: MercatosColors.primary_color,
  //       primary: Colors.white,
  //       elevation: 0.0,
  //       shadowColor: MercatosColors.primary_color.withOpacity(0.2),
  //       onSurface: MercatosColors.primary_color.withOpacity(0.2),
  //     );

  // static ButtonStyle get list_tile_button_style => ElevatedButton.styleFrom(
  //       padding: EdgeInsets.all(15.r),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15.0.r),
  //       ),
  //       onPrimary: MercatosColors.sub_color.withOpacity(0.3),
  //       primary: MercatosColors.border_color,
  //       elevation: 0.0,
  //       shadowColor: MercatosColors.sub_color,
  //     );

  // static BoxDecoration get box_decoration => BoxDecoration(
  //       border: Border.all(width: 1.5, color: MercatosColors.border_color),
  //       borderRadius: const BorderRadius.all(
  //         Radius.circular(MercatosConstants.border_radius),
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
  //           color: MercatosColors.primary_color.withOpacity(0.1),
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
  //           color: MercatosColors.sub_color.withOpacity(0.1),
  //           blurRadius: 9,
  //           spreadRadius: 5,
  //           offset: const Offset(0, 3),
  //         )
  //       ],
  //     );

  // static BoxDecoration get selection_box_decoration => const BoxDecoration(
  //     borderRadius: BorderRadius.all(
  //       Radius.circular(MercatosConstants.border_radius),
  //     ),
  //     color: MercatosColors.border_color);
}
