import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercatos/components/themes/mercatos_colors.dart';
import 'package:mercatos/components/widgets/mercatos_dialogs.dart';
import 'package:mercatos/features/auth/features/login/logic/scrolling_cubit/scrolling_cubit.dart';
import 'package:mercatos/features/auth/features/login/presentations/widgets/background_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../logic/login_form_bloc/login_bloc.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
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
    );
  }
}

class _SuccessScreen extends StatelessWidget {
  const _SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllers = context.read<ScrollingCubit>();
    return Scaffold(
        body: ScrollablePositionedList.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(
            height: ScreenUtil.defaultSize.height,
            child: const VideoPage(),
          );
        } else {
          return const LoginFormWidget();
        }
      },
      itemCount: 2,
      itemScrollController: controllers.itemScrollController,
      itemPositionsListener: controllers.itemPositionsListener,
    ));
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
