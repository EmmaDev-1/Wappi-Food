import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarDarkStyle({
  Color statusBarColor = Colors.transparent,
  Brightness statusBarIconBrightness = Brightness.dark,
  Brightness statusBarBrightness = Brightness.dark,
}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: statusBarIconBrightness,
      statusBarBrightness: statusBarBrightness,
    ),
  );
}

void setStatusBarLightStyle({
  Color statusBarColor = Colors.transparent,
  Brightness statusBarIconBrightness = Brightness.light,
  Brightness statusBarBrightness = Brightness.dark,
}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: statusBarIconBrightness,
      statusBarBrightness: statusBarBrightness,
    ),
  );
}
