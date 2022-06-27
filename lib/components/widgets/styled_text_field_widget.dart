import 'package:flutter/material.dart';
import 'package:mercatos/components/themes/mercatos_widget_styles.dart';

enum TextFiledType { email, password, text, number, multiline }

class StyledTextField extends StatefulWidget {
  const StyledTextField(
      {Key? key,
      this.onChanged,
      required this.hintText,
      this.type = TextFiledType.text,
      this.textInputAction,
      this.error_message,
      this.forced_hide_password_icon = false,
      this.forced_remove_obscure = false,
      this.initial_value,
      this.autofocus = false,
      this.onTap,
      this.is_enabled = true,
      this.suffixIcon})
      : super(key: key);

  final void Function(String)? onChanged;
  final String hintText;
  final TextFiledType type;
  final TextInputAction? textInputAction;
  final String? error_message;
  final bool forced_hide_password_icon;
  final bool forced_remove_obscure;
  final bool is_enabled;
  final Widget? suffixIcon;
  final String? initial_value;

  final bool autofocus;
  final void Function()? onTap;

  @override
  State<StyledTextField> createState() => _StyledTextFieldState();
}

class _StyledTextFieldState extends State<StyledTextField> {
  Widget? _suffixIcon;

  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.type == TextFiledType.password ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    TextInputType? keyboardType;
    bool enableSuggestions = true;

    switch (widget.type) {
      case TextFiledType.email:
        keyboardType = TextInputType.emailAddress;
        break;
      case TextFiledType.password:
        keyboardType = TextInputType.visiblePassword;
        enableSuggestions = false;

        _suffixIcon = IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(
              () {
                _isObscure = !_isObscure;
              },
            );
          },
        );

        break;
      case TextFiledType.text:
        keyboardType = TextInputType.text;
        break;
      case TextFiledType.number:
        keyboardType = TextInputType.number;
        break;

      case TextFiledType.multiline:
        keyboardType = TextInputType.multiline;
        break;
    }

    return TextFormField(
      onChanged: widget.onChanged,
      initialValue: widget.initial_value,
      autofocus: widget.autofocus,
      enabled: widget.is_enabled,
      obscureText: widget.forced_remove_obscure == true
          ? false
          : widget.type != TextFiledType.password
              ? false
              : _isObscure,
      // style: ,
      decoration: MercatosWidgetStyle.input_decoration.copyWith(
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon ??
            (widget.forced_hide_password_icon == true ? null : _suffixIcon),
        errorText: widget.error_message,
      ),

      keyboardType: keyboardType,
      enableSuggestions: enableSuggestions,
      autocorrect: false,
      showCursor: true,
      maxLines: widget.type == TextFiledType.multiline ? null : 1,
      textInputAction: widget.textInputAction,
      onTap: widget.onTap,
    );
  }
}
