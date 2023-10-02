// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class EltdButton extends StatelessWidget {
  String? title;
  double? width;
  double? height;
  Function()? press;
  Color? color;
  double? radius;
  double? fntSize;
  FontWeight? fntwgt;

  EltdButton(
      {this.title,
      this.width,
      this.height,
      this.press,
      this.color,
      this.radius,
      this.fntSize,
      this.fntwgt});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(width!, height!),
        maximumSize: Size(width!, height!),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)),
      ),
      onPressed: press,
      child: Text(
        title!,
        style: TextStyle(
          fontSize: fntSize,
          fontWeight: fntwgt!,
        ),
      ),
    );
  }
}
