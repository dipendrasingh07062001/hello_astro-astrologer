import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../theme/colorpalatt.dart';
import '../space.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Container(
        width: Get.width,
        // margin: const EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            spaceVertical(15),
            const Text(
              "Do you want to logout?",
              style: TextStyle(
                fontSize: 16,
                color: Palatt.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            spaceVertical(15),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.close(0),
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Palatt.primary,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(8)),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "NO",
                        style: TextStyle(
                          fontSize: 15,
                          color: Palatt.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                spaceHorizontal(1),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Palatt.primary,
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(8)),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "YES",
                        style: TextStyle(
                          fontSize: 15,
                          color: Palatt.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
