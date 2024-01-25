import 'package:astro/services/localization/keywords.dart';
import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/theme/themedata.dart';
import 'package:astro/util/buttons.dart';
import 'package:astro/util/images.dart';
import 'package:astro/view/widgets/custom_appbar.dart';
import 'package:astro/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Words.ContactUs.tr),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        children: [
          spaceVertical(20),
          Text(
            Words.Submityourquery.tr,
            style: googleFontstyle(const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Palatt.black,
            )),
          ),
          spaceVertical(10),
          TextFormField(
            cursorColor: Palatt.black,
            cursorWidth: 1,
            maxLines: 5,
            style: const TextStyle(fontSize: 15, color: Palatt.black),
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: const EdgeInsets.all(10),
              hintText: Words.Submityourquery.tr,
              hintStyle: const TextStyle(fontSize: 15, color: Palatt.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Palatt.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Palatt.primary),
              ),
            ),
          ),
          spaceVertical(30),
          RRButton(
            onTap: () {},
            data: Words.Submit.tr,
            height: 50,
            radius: 10,
            style: const TextStyle(fontSize: 16, color: Palatt.white),
            backgroundColor: Palatt.primary,
          ),
          spaceVertical(20),
          Row(
            children: [
              const Expanded(
                  child: Divider(
                color: Palatt.primary,
                thickness: 1,
                height: 1,
              )),
              spaceHorizontal(25),
              Text(
                Words.OR.tr,
                style: googleFontstyle(const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Palatt.primary,
                )),
              ),
              spaceHorizontal(25),
              const Expanded(
                  child: Divider(
                color: Palatt.primary,
                thickness: 1,
                height: 1,
              )),
            ],
          ),
          spaceVertical(20),
          RRButton2(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              onTap: () {},
              borderColor: Palatt.boxShadow,
              radius: 8,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.phone,
                    width: 17,
                    height: 17,
                    fit: BoxFit.fill,
                  ),
                  spaceHorizontal(10),
                  Text(
                    Words.Call.tr,
                    style: googleFontstyle(const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Palatt.black,
                    )),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              )),
          spaceVertical(15),
          RRButton2(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              onTap: () {},
              borderColor: Palatt.boxShadow,
              radius: 8,
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.mail,
                    width: 15,
                    height: 15,
                    fit: BoxFit.fill,
                  ),
                  spaceHorizontal(10),
                  Text(
                    Words.Mail.tr,
                    style: googleFontstyle(const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Palatt.black,
                    )),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              )),
        ],
      ),
    );
  }
}
