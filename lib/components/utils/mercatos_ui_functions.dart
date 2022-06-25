import 'package:flutter/material.dart';

part '../widgets/children_with_spacing_widget_function.dart';

abstract class MercatosUIFunctions {
  ///
  /// i.e for children in [Column] or [Row] widgets to make a space between them
  static childrenWithSpacing({
    required List<Widget> children,
    double spacing = 8,
  }) {
    return _childrenWithSpacingFunction(
      children: children,
      spacing: spacing,
    );
  }
}
