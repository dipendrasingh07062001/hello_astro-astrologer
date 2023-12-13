// ignore_for_file: must_be_immutable

import 'package:astro/theme/colorpalatt.dart';
import 'package:flutter/material.dart';

// loading indicator

Center loader = const Center(
    child: CircularProgressIndicator.adaptive(
  strokeWidth: 3,
  backgroundColor: Palatt.primary,
));
