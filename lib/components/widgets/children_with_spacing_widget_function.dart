import 'package:flutter/material.dart';

List<Widget> childrenWithSpacingFunction({
  required List<Widget> children,
  double spacing = 8,
}) {
  final space = SizedBox(width: spacing, height: spacing);
  return children.expand((widget) => [widget, space]).toList();
}
