import 'package:astro/services/localization/keywords.dart';
import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/theme/themedata.dart';
import 'package:astro/util/buttons.dart';
import 'package:astro/view/widgets/custom_appbar.dart';
import 'package:astro/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends GetView {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget notificationcard = RRButton2(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      borderColor: Palatt.primary,
      radius: 8,
      margin: const EdgeInsets.only(bottom: 12),
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 27.5,
          ),
          spaceHorizontal(10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Harry John",
                  style: googleFontstyle(
                    const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Text(
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                  style: googleFontstyle(
                    const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Palatt.grey,
                    ),
                  )),
            ],
          ))
        ],
      ),
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: Words.notification.tr.capitalize!,
      ),
      body: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            return notificationcard;
          }),
    );
  }
}
