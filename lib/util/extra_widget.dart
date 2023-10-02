// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'colors.dart';


// loading indicator

Center loader = Center(
    child: CircularProgressIndicator.adaptive(
  strokeWidth: 3,
  backgroundColor: AppColor.colPrimary,
));

