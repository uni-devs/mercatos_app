import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//
import '../../../../../../components/themes/mercatos_constants.dart';
import '../../../../../../components/widgets/mercatos_dialogs.dart';
import '../logic//registration_bloc/registration_bloc.dart';
import '../../../../../components/themes/mercatos_colors.dart';
import '../../../../../components/themes/mercatos_text_styles.dart';
import '../../../../../components/utils/mercatos_ui_functions.dart';
import 'widgets/set_password.dart';
import 'widgets/basic_information.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == RegistrationStatus.loading) {
          MercatosDialogs.loading();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case RegistrationStatus.error:
            return const _ErrorScreen();

          default:
            return const _SuccessScreen();
        }
      },
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MercatosColors.primary_color,
      body: Text("error"),
    );
  }
}

PageController controller = PageController(
  initialPage: 1,
);

class _SuccessScreen extends StatelessWidget {
  const _SuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _body([
      _header(),
      _appLogo(),
      Flexible(
        flex: 1,
        fit: FlexFit.loose,
        child: SizedBox(
          child: PageView(
            controller: controller,
            reverse: true,
            clipBehavior: Clip.none,
            // physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: BasicInformation(
                  pageController: controller,
                ),
              ),
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: SetPassword(
                  pageController: controller,
                ),
              ),
              const Text('1'),
              const Text('2'),
              const Text('3'),
              const Text('4'),
            ],
          ),
        ),
      ),
    ]);
  }

  Padding _appLogo() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MercatosConstants.vertical_padding * 2,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/logo.png",
          width: ScreenUtil().setWidth(100),
          height: ScreenUtil().setHeight(100),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        const Icon(Icons.arrow_back_ios),
        Text(
          'Create account',
          style: MercatosTextStyle.h1.copyWith(
            fontSize: MercatosConstants.h3_font_size,
          ),
        ),
      ],
    );
  }

  Widget _body(List<Widget> children) {
    return Scaffold(
      backgroundColor: MercatosColors.background_color,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MercatosConstants.horizontal_padding,
            vertical: MercatosConstants.vertical_padding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: MercatosUIFunctions.childrenWithSpacing(
              children: children,
              spacing: 14.h,
            ),
          ),
        ),
      ),
    );
  }
}
