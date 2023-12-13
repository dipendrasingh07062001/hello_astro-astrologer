import 'package:astro/theme/themedata.dart';
import 'package:flutter/material.dart';

import '../../theme/colorpalatt.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final double? height;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions = const [],
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: googleFontstyle(const TextStyle(
            fontSize: 22, fontWeight: FontWeight.w500, color: Palatt.black)),
      ),
      centerTitle: true,
      actions: actions,
      automaticallyImplyLeading: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
