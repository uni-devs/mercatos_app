part of '../utils/mercatos_ui_functions.dart';

List<Widget> _childrenWithSpacingFunction({
  required List<Widget> children,
  double spacing = 8,
}) {
  final space = SizedBox(width: spacing, height: spacing);
  return children.expand((widget) => [widget, space]).toList();
}
