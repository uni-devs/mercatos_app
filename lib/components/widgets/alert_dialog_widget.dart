part of 'mercatos_dialogs.dart';

enum _AlertType { greet, bad, inform, custom }

class _AlertSmartDialog extends StatelessWidget {
  const _AlertSmartDialog({
    Key? key,
    this.type = _AlertType.inform,
    this.midSectionChildren = const [],
    this.onPressed,
    this.enableClose = false,
    this.buttonLabel = "Okay",
    // this.customColor,
    this.customIconSVGPath,
  }) : super(key: key);
  final _AlertType type;

  final void Function()? onPressed;

  final bool enableClose;

  final List<Widget> midSectionChildren;

  final String buttonLabel;

  // final Color? customColor;

  final String? customIconSVGPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      // decoration: MercatosStyle.box_decoration.copyWith(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _titleIcon(),
          SizedBox(height: 20.h),
          _midSection(),
          SizedBox(height: 20.h),
          Row(
            children: [
              enableClose ? _cancelButton() : const SizedBox(),
              enableClose ? SizedBox(width: 5.w) : const SizedBox(),
              Expanded(child: _button()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cancelButton() {
    return OutlinedButton(
      onPressed: () {
        SmartDialog.dismiss();
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        // primary: MercatosColors.primary_color,
        elevation: 0.0,
        padding: EdgeInsets.all(20.r),
        side: BorderSide(
          // color: MercatosColors.primary_color,
          width: 1.w,
        ),
      ),
      child: const Center(
        child: Text(
          'Cancel',
          // style: MercatosStyle.submitStyle.copyWith(
          //   color: MercatosColors.primary_color,
          //   fontWeight: FontWeight.w500,
          // ),
        ),
      ),
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: onPressed != null
          ? () {
              onPressed!();
              SmartDialog.dismiss();
            }
          : () {
              SmartDialog.dismiss();
            },
      // style: MercatosStyle.submit_button_style,
      child: Center(
        child: Text(
          buttonLabel,
          // style: MercatosStyle.submitStyle,
        ),
      ),
    );
  }

  Widget _midSection() {
    return Column(
        children: MercatosUIFunctions.childrenWithSpacing(
      children: midSectionChildren,
      spacing: 10.h,
    ));
  }

  Widget _titleIcon() {
    /* final String _iconPath = type == AlertType.greet
        ? 'assets/icons/alert_check.svg'
        : type == AlertType.bad
            ? 'assets/icons/alert_close.svg'
            : type == AlertType.inform
                ? 'assets/icons/alert_hand.svg'
                : customIconSVGPath ?? 'assets/icons/alert_hand.svg'; */
    /*   final Color _alertColor = type == AlertType.greet
        ? MercatosColors.sub_color
        : type == AlertType.bad
            ? MercatosColors.error_color
            : type == AlertType.inform
                ? MercatosColors.grey_color
                : customColor ?? MercatosColors.grey_color; */
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: BounceInDown(
        child: CircleAvatar(
            backgroundColor: /* _alertColor */ Colors.white,
            radius: 30.r,
            child: /* SvgPicture.asset(
            _iconPath,
            height: 30.h,
          ), */
                const SizedBox()),
      ),
    );
  }
}
