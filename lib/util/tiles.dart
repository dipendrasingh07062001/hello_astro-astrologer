import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colorpalatt.dart';

class DrawerTile extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onTap;
  final bool showdivider;
  const DrawerTile(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap,
      this.showdivider = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: onTap,
          leading: SvgPicture.asset(
            image,
            height: 40,
            width: 40,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              color: Palatt.white,
            ),
          ),
        ),
        showdivider
            ? const Divider(height: 1, color: Palatt.white)
            : Container()
      ],
    );
  }
}
