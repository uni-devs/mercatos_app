import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//
import '../../../../../../components/themes/mercatos_text_styles.dart';
import '../../../../../../components/utils/mercatos_ui_functions.dart';
import '../../../../../../components/widgets/header_widget.dart';
import '../../../../../../components/widgets/styled_text_field_widget.dart';
import '../../../../../../components/themes/mercatos_colors.dart';
import 'page_indicator.dart';
import 'next_button.dart';

class SetPassword extends StatelessWidget {
  final PageController pageController;

  const SetPassword({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: MercatosUIFunctions.childrenWithSpacing(
        children: [
          _header(),
          _passwordForm(context),
          Row(
            children: [
              const Icon(Icons.check, color: MercatosColors.accepted_color),
              Text(
                "Accepted",
                style: MercatosTextStyle.number_text.copyWith(
                  color: MercatosColors.accepted_color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          _nextAndIndicator(),
        ],
        spacing: 22.h,
      ),
    );
  }

  Widget _nextAndIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PageIndicator(
          controller: pageController,
        ),
        _NextButton(),
      ],
    );
  }

  Widget _NextButton() {
    return NextButton(
      onTap: () {
        pageController.animateToPage(
          2,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  Widget _passwordForm(BuildContext context) {
    _passwordField() {
      return StyledTextField(
        hintText: 'Password',
        type: TextFiledType.password,
        onChanged: (text) {},
        prefixIcon: const Icon(
          Icons.key,
          color: MercatosColors.grey_color,
        ),
      );
    }

    _repeatPasswordField() {
      return StyledTextField(
        hintText: 'Repeat password',
        type: TextFiledType.password,
        onChanged: (text) {},
        prefixIcon: const Icon(
          Icons.key,
          color: MercatosColors.grey_color,
        ),
      );
    }

    return Column(
      children: MercatosUIFunctions.childrenWithSpacing(
        children: [
          _passwordField(),
          _repeatPasswordField(),
        ],
        spacing: 18.h,
      ),
    );
  }

  HeaderWidget _header() {
    return const HeaderWidget(
      title: 'Set',
      titleNormal: "a password",
      subtitle: 'Capitalize Lorem',
    );
  }
}
