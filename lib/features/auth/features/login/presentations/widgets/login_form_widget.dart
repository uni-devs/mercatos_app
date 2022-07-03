import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercatos/components/themes/mercatos_constants.dart';
import 'package:mercatos/components/utils/mercatos_ui_functions.dart';
import 'package:mercatos/components/widgets/styled_divider_widget.dart';
import 'package:mercatos/components/widgets/styled_text_button_widget.dart';

import '../../../../../../components/widgets/header_widget.dart';
import '../../../../../../components/widgets/styled_button_widget.dart';
import '../../../../../../components/widgets/styled_icon_button_widget.dart';
import '../../../../../../components/widgets/styled_text_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body(
      [
        _header(),
        _loginForm(context),
        _authButtons(context),
        _divider(),
        _socialButtons(),
        _createAccountButton(),
      ],
    );
  }

  Widget _createAccountButton() {
    return Align(
      // alignment: Alignment.centerLeft,
      child: StyledTextButton(
        text: "Don't have an account? create one",
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

  Widget _divider() {
    return const StyledDivider(text: "Or");
  }

  /// forget password button & login button
  Widget _authButtons(BuildContext context) {
    _forgetPasswordButton() {
      return Align(
        alignment: Alignment.centerLeft,
        child: StyledTextButton(
          text: "Forget password ?",
          onPressed: () {},
        ),
      );
    }

    _loginButton() {
      return StyledButtonWidget(
        child: const Text("Login"),
        onPressed: () {},
      );
    }

    return Column(
      children: MercatosUIFunctions.childrenWithSpacing(
        children: [
          _forgetPasswordButton(),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    _emailTextFiled() {
      return StyledTextField(
        hintText: 'Email',
        type: TextFiledType.email,
        onChanged: (text) {},
        suffixIcon: const Icon(Icons.email),
      );
    }

    _passwordTextFiled() {
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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(MercatosConstants.border_radius),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MercatosConstants.horizontal_padding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: MercatosUIFunctions.childrenWithSpacing(
                children: children,
                spacing: 14.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
