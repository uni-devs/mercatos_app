import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercatos/components/themes/mercatos_colors.dart';
import 'package:mercatos/components/widgets/mercatos_dialogs.dart';

import '../logic/login_form_bloc/login_bloc.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MercatosColors.background_color,
      body: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == LoginStatus.loading) {
            MercatosDialogs.loading();
          }
        },
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case LoginStatus.error:
              return const _ErrorScreen();

            default:
              return const _SuccessScreen();
          }
        },
      ),
    );
  }
}

class _SuccessScreen extends StatelessWidget {
  const _SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginFormWidget();
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MercatosColors.primary_color,
      child: const Text("error"),
    );
  }
}
