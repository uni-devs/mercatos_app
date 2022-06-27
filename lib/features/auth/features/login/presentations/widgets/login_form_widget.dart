import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercatos/components/themes/mercatos_constants.dart';
import 'package:mercatos/components/utils/mercatos_ui_functions.dart';

import '../../../../../../components/widgets/header_widget.dart';
import '../../../../../../components/widgets/styled_bottom_widget.dart';
import '../../../../../../components/widgets/styled_text_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body(
      [
        _header(),
        _loginForm(context),
        _loginButton(context),
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return StyledBottomWidget();
  }

  Widget _loginForm(BuildContext context) {
    Widget _emailTextFiled() {
      return StyledTextField(
        hintText: 'Email',
        type: TextFiledType.email,
        onChanged: (text) {},
        suffixIcon: const Icon(Icons.email),
      );
    }

    Widget _passwordTextFiled() {
      return StyledTextField(
        hintText: 'Password',
        type: TextFiledType.password,
        onChanged: (text) {},
      );
    }

    return Column(
      children: MercatosUIFunctions.childrenWithSpacing(
        children: [
          _emailTextFiled(),
          _passwordTextFiled(),
        ],
      ),
    );
  }

  Widget _header() {
    return const HeaderWidget(
      title: 'Login',
      subtitle: 'Login to your account',
    );
  }

  Widget _body(List<Widget> children) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MercatosConstants.horizontal_padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: MercatosUIFunctions.childrenWithSpacing(
            children: children,
            spacing: 14.h,
          ),
        ),
      ),
    );
  }
}
