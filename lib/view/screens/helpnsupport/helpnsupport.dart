import 'package:astro/theme/themedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../theme/colorpalatt.dart';
import '../../../util/buttons.dart';
import '../../../util/images.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/space.dart';

class HelpNSupport extends GetView {
  const HelpNSupport({super.key});

  @override
  Widget build(BuildContext context) {
    Widget chatview = Expanded(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.background2))),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [chatcard(), chatcard(), chatcard(), chatcard()],
        ),
      ),
    );
    Widget userAssistent = Expanded(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.background2))),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            return RRButton2(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              // borderColor: Palatt.primary,
              backgroundColor: Palatt.white,
              boxShadow: const [
                BoxShadow(color: Palatt.boxShadow, blurRadius: 6)
              ],
              radius: 8,
              margin: const EdgeInsets.symmetric(vertical: 8),
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
                      Text("I want to consult for health",
                          style: googleFontstyle(
                            const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Palatt.grey,
                            ),
                          )),
                      Text("05 Aug 22, 6:20 PM",
                          style: googleFontstyle(
                            const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Palatt.grey,
                            ),
                          )),
                    ],
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Palatt.white,
      appBar: const CustomAppBar(
        title: "Help & Support",
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                color: Palatt.white,
                boxShadow: [BoxShadow(blurRadius: 1, color: Palatt.boxShadow)]),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Palatt.black, width: 2),
                    ),
                  ),
                  child: Text(
                    "Admin Support",
                    style: googleFontstyle(const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Palatt.black,
                    )),
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      // border: Border(
                      //   bottom: BorderSide(color: Palatt.black, width: 2),
                      // ),
                      ),
                  child: Text(
                    "User Assistant",
                    style: googleFontstyle(const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: Palatt.grey,
                    )),
                  ),
                ))
              ],
            ),
          ),
          // chatview,
          userAssistent,
          typemessage(),
        ],
      ),
    );
  }

  Widget typemessage() => Container(
        width: Get.width,
        // height: 80,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 18,
        ),
        decoration: const BoxDecoration(
            color: Palatt.white,
            boxShadow: [BoxShadow(color: Palatt.boxShadow, blurRadius: 4)]),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              cursorColor: Palatt.primary,
              cursorWidth: 1,
              cursorHeight: 15,
              maxLines: 5,
              minLines: 1,
              style: const TextStyle(
                  fontSize: 13, color: Palatt.black, height: 1.5),
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  filled: true,
                  fillColor: Palatt.white,
                  hintText: "Type a message",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  hintStyle: const TextStyle(
                      color: Palatt.grey, fontSize: 13, height: 2),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Palatt.grey,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Palatt.primary,
                      )),
                  focusColor: Palatt.primary,
                  suffixIcon: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        AppImages.attachment,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  )),
            )),
            spaceHorizontal(10),
            SvgPicture.asset(
              AppImages.send,
              height: 50,
              width: 50,
            ),
          ],
        ),
      );

  Widget chatcard() => Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(maxWidth: Get.width * 0.6),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Palatt.blueshadelight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello Namaste....",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Palatt.black,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "06:30 PM",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Palatt.greyshade1,
                    ),
                  ),
                  spaceHorizontal(10),
                  SvgPicture.asset(
                    AppImages.check,
                    height: 18,
                    width: 18,
                    color: Palatt.greyshade1,
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
