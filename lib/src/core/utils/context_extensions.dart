import 'package:flutter/material.dart';

extension CTXHelper on BuildContext {
  EdgeInsets get systemPadding => MediaQuery.of(this).padding;
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.height;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
