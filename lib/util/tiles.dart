import 'package:astro/view/widgets/space.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              children: [
                SvgPicture.asset(
                  image,
                  height: 24,
                  width: 24,
                ),
                spaceHorizontal(13),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Palatt.white,
                  ),
                ),
              ],
            ),
          ),
          // ListTile(
          //   onTap: onTap,
          //   leading: SvgPicture.asset(
          //     image,
          //     height: 24,
          //     width: 24,
          //   ),

          //   title: Text(
          //     title,
          //     style: const TextStyle(
          //       fontSize: 17,
          //       color: Palatt.white,
          //     ),
          //   ),
          // ),
          // showdivider
          //     ? const Divider(height: 1, color: Palatt.white)
          //     : Container()
        ],
      ),
    );
  }
}
