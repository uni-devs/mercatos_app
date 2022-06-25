import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mercatos/components/utils/mercatos_ui_functions.dart';

part 'alert_dialog_widget.dart';

abstract class MercatosDialogs {
  static void loading() {
    SmartDialog.showLoading(backDismiss: false);
  }

  static void dismiss() {
    SmartDialog.dismiss();
  }

  static void greatMessage(List<String?>? messages) {
    SmartDialog.show(
      builder: (context) => _AlertSmartDialog(
        type: _AlertType.greet,
        midSectionChildren: messages == null
            ? const [Text("Great!")]
            : [...messages.map((message) => Text(message ?? '')).toList()],
      ),
    );
  }

  static void errorMessage(List<String?>? messages) {
    SmartDialog.show(
      builder: (context) => _AlertSmartDialog(
        type: _AlertType.bad,
        midSectionChildren: messages == null
            ? const [Text("Error!")]
            : [...messages.map((message) => Text(message ?? '')).toList()],
      ),
    );
  }

  static void infoMessage(List<String?>? messages) {
    SmartDialog.show(
      builder: (context) => _AlertSmartDialog(
        type: _AlertType.inform,
        midSectionChildren: messages == null
            ? const [Text("!")]
            : [...messages.map((message) => Text(message ?? '')).toList()],
      ),
    );
  }

  static void customMessage(List<String?>? messages) {
    SmartDialog.show(
      builder: (context) => _AlertSmartDialog(
        type: _AlertType.inform,
        midSectionChildren: messages == null
            ? const [Text("!")]
            : [...messages.map((message) => Text(message ?? '')).toList()],
      ),
    );
  }

  static void cancelPage({
    required void Function() onPressed,
    String? label,
    required List<String> midData,
  }) {
    SmartDialog.show(
        builder: (context) => _AlertSmartDialog(
              onPressed: onPressed,
              enableClose: true,
              buttonLabel: label ?? "Yes, close it.",
              midSectionChildren: midData
                  .map(
                    (message) => Text(
                      message,
                      // style: MercatosStyle.h3Style,
                      textAlign: TextAlign.center,
                    ),
                  )
                  .toList(),
            ));
  }

  static void removeParcel({
    required void Function() onPressed,
  }) {
    // احا
    SmartDialog.show(
      builder: (context) => _AlertSmartDialog(
        type: _AlertType.custom,
        customIconSVGPath: "assets/icons/trash.svg",
        enableClose: true,
        // customColor: MercatosColors.primary_color.withOpacity(0.1),
        buttonLabel: "Yes, remove it.",
        midSectionChildren: const [
          Text('Are you sure you want to remove this parcel?'),
        ],
        onPressed: onPressed,
      ),
    );
  }
}
