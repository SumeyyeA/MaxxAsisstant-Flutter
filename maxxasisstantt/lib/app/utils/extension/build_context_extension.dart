import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  EdgeInsets get mediumMargin => const EdgeInsets.all(5);
}
