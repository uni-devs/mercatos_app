import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../components/themes/mercatos_colors.dart';
import '../../../../../../components/widgets/styled_icon_button_widget.dart';
import '../../../../../../components/utils/mercatos_ui_functions.dart';
import '../../../../../../components/widgets/header_widget.dart';
import '../../../../../../components/widgets/styled_divider_widget.dart';
import '../../../../../../components/widgets/styled_text_button_widget.dart';
import '../../../../../../components/widgets/styled_text_field_widget.dart';
import 'page_indicator.dart';
import 'next_button.dart';

class BasicInformation extends StatelessWidget {
  final PageController pageController;

  const BasicInformation({Key? key, required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: MercatosUIFunctions.childrenWithSpacing(
        children: [
          _header(),
          _infoForm(context),
          _nextAndIndicator(),
          _divider(),
          _socialButtons(),
          _createAccountButton(),
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
          1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  Widget _infoForm(BuildContext context) {
    _firstNameField() {
      return StyledTextField(
        hintText: 'First name',
        type: TextFiledType.text,
        onChanged: (text) {},
        prefixIcon: const Icon(
          Icons.person,
          color: MercatosColors.grey_color,
        ),
      );
    }

    _secondNameField() {
      return StyledTextField(
        hintText: 'Second name',
        type: TextFiledType.text,
        onChanged: (text) {},
        prefixIcon: const Icon(
          Icons.person,
          color: MercatosColors.grey_color,
        ),
        forced_hide_password_icon: true,
      );
    }

    _emailTextFiled() {
      return StyledTextField(
        hintText: 'Email',
        type: TextFiledType.email,
        onChanged: (text) {},
        prefixIcon: const Icon(
          Icons.email,
          color: MercatosColors.grey_color,
        ),
      );
    }

    _phoneTextFiled() {
      return StyledTextField(
        hintText: '(+02) 1281507340',
        type: TextFiledType.number,
        onChanged: (text) {},
        prefixIcon: const Icon(
          Icons.phone,
          color: MercatosColors.grey_color,
        ),
        forced_hide_password_icon: true,
      );
    }

    return Column(
      children: MercatosUIFunctions.childrenWithSpacing(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: ScreenUtil.defaultSize.width * 0.48,
                  child: _firstNameField()),
              SizedBox(
                  width: ScreenUtil.defaultSize.width * 0.48,
                  child: _secondNameField()),
            ],
          ),
          _emailTextFiled(),
          _phoneTextFiled(),
        ],
        spacing: 18.h,
      ),
    );
  }

  HeaderWidget _header() {
    return const HeaderWidget(
      title: 'What’s',
      titleNormal: "your basic information?",
      subtitle: 'Let other know who are you',
    );
  }

  Widget _divider() {
    return const StyledDivider(text: "OR");
  }

  Widget _createAccountButton() {
    return Align(
      child: StyledTextButton(
        text: "Do you have an account? Log in",
        onPressed: () {},
      ),
    );
  }

  Widget _socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StyledIconButton(
          icon: const Icon(Icons.facebook_outlined),
          onPressed: () {},
        ),
        StyledIconButton(
          icon: const Icon(Icons.flutter_dash),
          onPressed: () {},
        ),
        StyledIconButton(
          icon: const Icon(Icons.apple_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
