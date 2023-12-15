import 'package:astro/theme/themedata.dart';
import 'package:astro/util/buttons.dart';
import 'package:astro/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../theme/colorpalatt.dart';

class DateFilter extends StatelessWidget {
  const DateFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, right: 25, left: 25),
            // height: 200,
            width: Get.width,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                // spaceVertical(15),
                const Text(
                  "Date Filter",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * .03, bottom: Get.height * .03),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: Get.height * .01),
                              height: 30,
                              width: 25,
                              child: SvgPicture.asset(
                                AppImages.calendar,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "From date",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Palatt.grey),
                                ),
                                Text("01-10-2023",
                                    style: googleFontstyle(
                                      TextStyle(
                                          fontSize: 16,
                                          height: 1,
                                          color: Palatt.primary,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          color: Palatt.black,
                          thickness: 1,
                          endIndent: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: Get.height * .01),
                              height: 30,
                              width: 25,
                              child: SvgPicture.asset(
                                AppImages.calendar,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .03,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To date",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Palatt.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text("01-10-2023",
                                    style: googleFontstyle(
                                      TextStyle(
                                          fontSize: 16,
                                          color: Palatt.primary,
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                RRButton(
                  radius: 10,
                  height: 47,
                  width: Get.width,
                  backgroundColor: Palatt.primary,
                  onTap: () {},
                  data: "Go Filter",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Palatt.white),
                )
              ],
            ),
          ),
          Positioned(
            right: 18,
            top: 8,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Palatt.grey,
                      blurRadius: 6,
                    )
                  ],
                  color: Palatt.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Palatt.black,
                  // grade: 2,
                  size: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
