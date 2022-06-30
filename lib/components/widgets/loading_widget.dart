import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mercatos/components/themes/mercatos_colors.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: _loadingWidget(),
    );
  }

  Widget _loadingWidget() {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: MercatosColors.primary_color,
        size: 35,
        // secondRingColor: MercatosColors.sub_color,
        // thirdRingColor: MercatosColors.sub_color.withOpacity(0.3),
      ),
    );
  }
}
