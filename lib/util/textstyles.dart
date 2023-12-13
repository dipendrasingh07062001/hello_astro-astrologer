import 'package:flutter/material.dart';

Text textStyle(String text, Color? color,
    {double? fontSize,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing,
    TextAlign? textAlign = TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
    ),
  );
}

Text textStyleNew(String text, Color? color,
    {double? fontSize,
    FontWeight? fontWeight,
    double? height,
    double? letterSpacing}) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: height,
        letterSpacing: letterSpacing),
  );
}
