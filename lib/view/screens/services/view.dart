import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/util/images.dart';
import 'package:astro/view/widgets/custom_appbar.dart';
import 'package:astro/view/widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ServicesView extends GetView {
  const ServicesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Services",
      ),
      body: Column(children: [
        spaceVertical(15),
        service(AppImages.service_chat, "Chat", true),
        service(AppImages.service_call, "Call", false),
        service(AppImages.service_calender, "Busy", false),
      ]),
    );
  }

  Widget service(String icon, String title, bool value) => Container(
        height: 75,
        width: Get.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Palatt.white,
            boxShadow: const [
              BoxShadow(
                color: Palatt.boxShadow,
                blurRadius: 6,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 42,
                ),
                spaceHorizontal(10),
                const Text(
                  "Chat",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Palatt.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
              width: 54,
              child: CupertinoSwitch(
                onChanged: (p0) {
                  value = p0;
                },
                activeColor: Palatt.primary,
                trackColor: Palatt.grey,
                value: value,
              ),
            ),
          ],
        ),
      );
}
