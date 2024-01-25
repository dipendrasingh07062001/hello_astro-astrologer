import 'package:astro/services/localization/keywords.dart';
import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/theme/themedata.dart';
import 'package:astro/util/buttons.dart';
import 'package:astro/view/widgets/custom_appbar.dart';
import 'package:astro/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreeServices extends StatelessWidget {
  const FreeServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Words.FreeServices.tr, automaticallyImplyLeading: false),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          RRButton2(
            onTap: () {},
            radius: 10,
            backgroundColor: Palatt.white,
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            boxShadow: const [
              BoxShadow(blurRadius: 6, color: Palatt.boxShadow)
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Words.Kundali.tr,
                    style: googleFontstyle(
                      const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                )
              ],
            ),
          ),
          spaceVertical(15),
          RRButton2(
            onTap: () {},
            radius: 10,
            backgroundColor: Palatt.white,
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            boxShadow: const [
              BoxShadow(blurRadius: 6, color: Palatt.boxShadow)
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Words.Horoscope.tr,
                    style: googleFontstyle(
                      const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                )
              ],
            ),
          ),
          spaceVertical(15),
          RRButton2(
            onTap: () {},
            radius: 10,
            backgroundColor: Palatt.white,
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            boxShadow: const [
              BoxShadow(blurRadius: 6, color: Palatt.boxShadow)
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Words.Matchmaking.tr,
                    style: googleFontstyle(
                      const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                )
              ],
            ),
          ),
          spaceVertical(15),
          RRButton2(
            onTap: () {},
            radius: 10,
            backgroundColor: Palatt.white,
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            boxShadow: const [
              BoxShadow(blurRadius: 6, color: Palatt.boxShadow)
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Words.Panchang.tr,
                    style: googleFontstyle(
                      const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
