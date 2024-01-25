import 'dart:math';

import 'package:astro/services/localization/keywords.dart';
import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/theme/themedata.dart';
import 'package:astro/util/buttons.dart';
import 'package:astro/util/methods.dart';
import 'package:astro/view/widgets/custom_appbar.dart';
import 'package:astro/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../util/textstyles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget availabilityTime = CustomExpensionTile(
        height: 42,
        decoration: BoxDecoration(
            color: Palatt.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Palatt.boxShadow,
                blurRadius: 6,
              )
            ]),
        title: Text(Words.Availabilitytime.tr,
            style: googleFontstyle(
              const TextStyle(
                fontSize: 16,
                color: Palatt.black,
                fontWeight: FontWeight.w500,
              ),
            )),
        children: [
          // const Divider(color: Palatt.grey, thickness: 1),
          Container(
            height: 53,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: Palatt.blueshadelight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   astroPrfileController.selectedavailability =
                    //       astroPrfileController
                    //           .astrologer.availabilityTiming![index];
                    // });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 14),
                    width: 34,
                    height: 45,
                    decoration: const BoxDecoration(
                      // color: Palatt.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            DateFormat("EEE")
                                .format(
                                    DateTime.now().add(Duration(days: index)))
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: googleFontstyle(
                              const TextStyle(
                                  fontSize: 10,
                                  color: Palatt.black,
                                  fontWeight: FontWeight.w600),
                            )),
                        CircleAvatar(
                          radius: 14,
                          backgroundColor:
                              index == 0 ? Palatt.primary : Palatt.transparent,
                          child: Text(
                              DateFormat("dd").format(
                                  DateTime.now().add(Duration(days: index))),
                              textAlign: TextAlign.center,
                              style: googleFontstyle(
                                TextStyle(
                                    fontSize: 15,
                                    color: index == 0
                                        ? Palatt.white
                                        : Palatt.black,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // const Divider(color: Palatt.grey, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 13),
            child: Text("Walking",
                style: googleFontstyle(
                  const TextStyle(
                    fontSize: 19,
                    color: Palatt.black,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Start time",
                            style: googleFontstyle(
                              const TextStyle(
                                fontSize: 15,
                                color: Palatt.black,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        timingSlot(
                            DateFormat().add_jm().format(
                                DateTime.now().add(Duration(hours: index))),
                            foregroundColor: Palatt.greyshade2,
                            borderColor: Palatt.greyshade2,
                            radius: 8
                            //     onTap: () {
                            //   setState(() {
                            //     astroPrfileController.whichtime =
                            //         astroPrfileController
                            //             .selectedavailability
                            //             .timing[index];
                            //   });
                            // },
                            ),
                      ],
                    ),
                  ),
                  spaceHorizontal(14),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("End time",
                            style: googleFontstyle(
                              const TextStyle(
                                fontSize: 15,
                                color: Palatt.black,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        timingSlot(
                            DateFormat().add_jm().format(
                                  DateTime.now().add(Duration(hours: index)),
                                ),
                            radius: 8,
                            borderColor: Palatt.greyshade2,
                            foregroundColor: Palatt.greyshade2
                            //     onTap: () {
                            //   setState(() {
                            //     astroPrfileController.whichtime =
                            //         astroPrfileController
                            //             .selectedavailability
                            //             .timing[index];
                            //   });
                            // },
                            ),
                      ],
                    ),
                  ),
                  spaceHorizontal(18),
                  Expanded(
                    flex: 2,
                    child: RRButton2(
                      onTap: () {},
                      height: 34,
                      radius: 8,
                      backgroundColor: Palatt.primary,
                      child: const Icon(
                        Icons.add,
                        color: Palatt.white,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
          spaceVertical(10),
          continuebutton(() {}),
          spaceVertical(10),
        ]);
    Widget language = CustomExpensionTile(
      height: 42,
      decoration: BoxDecoration(
          color: Palatt.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Palatt.boxShadow,
              blurRadius: 6,
            )
          ]),
      title: Text(Words.LANGUAGE.tr.capitalize!,
          style: googleFontstyle(
            const TextStyle(
              fontSize: 16,
              color: Palatt.black,
              fontWeight: FontWeight.w500,
            ),
          )),
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Palatt.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Palatt.boxShadow,
                  blurRadius: 6,
                )
              ]),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              spaceVertical(15),
              RRButton2(
                onTap: () {},
                radius: 10,
                height: 50,
                backgroundColor: Palatt.white,
                boxShadow: const [
                  BoxShadow(
                    color: Palatt.boxShadow,
                    blurRadius: 6,
                  )
                ],
                child: Row(
                  children: [
                    spaceHorizontal(20),
                    SizedBox(
                      height: 18,
                      width: 18,
                      child: Checkbox(
                        onChanged: (value) {},
                        value: false,
                        activeColor: Palatt.primary,
                        checkColor: Palatt.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        side: const BorderSide(color: Palatt.primary, width: 1),
                      ),
                    ),
                    spaceHorizontal(20),
                    Text("English",
                        style: googleFontstyle(
                          const TextStyle(
                            fontSize: 16,
                            color: Palatt.black,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ],
                ),
              ),
              spaceVertical(15),
              RRButton2(
                onTap: () {},
                radius: 10,
                height: 50,
                backgroundColor: Palatt.white,
                boxShadow: const [
                  BoxShadow(
                    color: Palatt.boxShadow,
                    blurRadius: 6,
                  )
                ],
                child: Row(
                  children: [
                    spaceHorizontal(20),
                    SizedBox(
                      height: 18,
                      width: 18,
                      child: Checkbox(
                        onChanged: (value) {},
                        value: false,
                        activeColor: Palatt.primary,
                        checkColor: Palatt.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        side: const BorderSide(color: Palatt.primary, width: 1),
                      ),
                    ),
                    spaceHorizontal(20),
                    Text("Hindi",
                        style: googleFontstyle(
                          const TextStyle(
                            fontSize: 16,
                            color: Palatt.black,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ],
                ),
              ),
              spaceVertical(20),
              continuebutton(() {}, margin: EdgeInsets.zero),
              spaceVertical(10),
            ],
          ),
        )
      ],
    );
    Widget rateperminute = CustomExpensionTile(
      height: 42,
      decoration: BoxDecoration(
          color: Palatt.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Palatt.boxShadow,
              blurRadius: 6,
            )
          ]),
      title: Text(Words.RateperMinute.tr,
          style: googleFontstyle(
            const TextStyle(
              fontSize: 16,
              color: Palatt.black,
              fontWeight: FontWeight.w500,
            ),
          )),
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Palatt.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Palatt.boxShadow,
                  blurRadius: 6,
                )
              ]),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              spaceVertical(10),
              Text(Words.Call_Price.tr,
                  style: googleFontstyle(
                    const TextStyle(
                      fontSize: 17,
                      color: Palatt.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              spaceVertical(5),
              shadowBox(child: textformfeild(hint: Words.Price.tr)),
              spaceVertical(10),
              Text(Words.Chat_Price.tr,
                  style: googleFontstyle(
                    const TextStyle(
                      fontSize: 17,
                      color: Palatt.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              spaceVertical(5),
              shadowBox(child: textformfeild(hint: Words.Price.tr)),
              spaceVertical(20),
              continuebutton(() {}, margin: EdgeInsets.zero),
              spaceVertical(10),
            ],
          ),
        )
      ],
    );
    Widget expertise = CustomExpensionTile(
      height: 42,
      decoration: BoxDecoration(
          color: Palatt.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Palatt.boxShadow,
              blurRadius: 6,
            )
          ]),
      title: Text(Words.Expertise.tr,
          style: googleFontstyle(
            const TextStyle(
              fontSize: 16,
              color: Palatt.black,
              fontWeight: FontWeight.w500,
            ),
          )),
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Palatt.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Palatt.boxShadow,
                  blurRadius: 6,
                )
              ]),
          child: Column(
            children: [
              spaceVertical(10),
              GridView.count(
                crossAxisCount: 3,
                // padding: const EdgeInsets.symmetric(
                //   horizontal: 15,
                //   vertical: 10,
                // ),
                childAspectRatio: 1.8,
                shrinkWrap: true,
                mainAxisSpacing: 8,
                crossAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  9,
                  (index) => timingSlot("Vedic Astrologer",
                      borderColor: Palatt.primary,
                      radius: 5,
                      backgroundColor:
                          index == 0 ? Palatt.primary : Palatt.white,
                      foregroundColor: index == 0 ? Palatt.white : Palatt.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                      //     onTap: () {
                      //   setState(() {
                      //     astroPrfileController.whichtime =
                      //         astroPrfileController
                      //             .selectedavailability
                      //             .timing[index];
                      //   });
                      // },
                      ),
                ),
              ),
              spaceVertical(30),
              continuebutton(() {}, margin: EdgeInsets.zero),
              spaceVertical(30),
            ],
          ),
        )
      ],
    );
    Widget uploadProfile = RRButton2(
      onTap: () {},
      // margin:  const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 42,
      radius: 10,
      boxShadow: const [
        BoxShadow(
          color: Palatt.boxShadow,
          blurRadius: 6,
        )
      ],
      width: Get.width,
      backgroundColor: Palatt.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Words.Uploadprofile.tr.capitalize!,
              style: googleFontstyle(const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Palatt.black,
              ))),
          const Icon(
            Icons.upload,
            color: Palatt.black,
          )
        ],
      ),
    );
    Widget galleryImage = RRButton2(
      onTap: () {},
      // margin:  const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 42,
      radius: 10,
      boxShadow: const [
        BoxShadow(
          color: Palatt.boxShadow,
          blurRadius: 6,
        )
      ],
      width: Get.width,
      backgroundColor: Palatt.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Words.GalleryImages.tr,
              style: googleFontstyle(const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Palatt.black,
              ))),
          const Icon(
            Icons.upload,
            color: Palatt.black,
          )
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Palatt.white,
      appBar: CustomAppBar(
        title: Words.Profile.tr,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          shadowBox(
              child: textformfeild(
                hint: Words.Name.tr,
              ),
              height: 42),
          spaceVertical(16),
          RRButton(
            onTap: () {},
            data: Words.EarningHistory.tr,
            alignment: Alignment.centerLeft,
            backgroundColor: Palatt.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            boxShadow: const [
              BoxShadow(blurRadius: 6, color: Palatt.boxShadow)
            ],
            height: 42,
            radius: 10,
            style: googleFontstyle(const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Palatt.black,
            )),
          ),
          spaceVertical(16),
          language,
          spaceVertical(16),
          rateperminute,
          spaceVertical(16),
          expertise,
          spaceVertical(16),
          availabilityTime,
          spaceVertical(16),
          uploadProfile,
          spaceVertical(16),
          galleryImage
        ],
      ),
    );
  }

  Widget shadowBox({Widget? child, double? height}) {
    return Container(
      height: height ?? 50,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Palatt.white,
          boxShadow: const [BoxShadow(blurRadius: 6, color: Palatt.boxShadow)]),
      child: child,
    );
  }

  Widget textformfeild({String? hint}) {
    return TextFormField(
      style: googleFontstyle(const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Palatt.black,
      )),
      cursorHeight: 18,
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        isCollapsed: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        hintStyle: googleFontstyle(const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Palatt.black,
            height: 1)),
        border: InputBorder.none,
      ),
    );
  }
}

class CustomExpensionTile extends StatefulWidget {
  final Decoration? decoration;
  final Widget title;
  final List<Widget> children;
  final double? height;
  const CustomExpensionTile({
    super.key,
    this.decoration,
    this.height,
    required this.title,
    required this.children,
  });

  @override
  State<CustomExpensionTile> createState() => _CustomExpensionTileState();
}

class _CustomExpensionTileState extends State<CustomExpensionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  // late Animation animation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (animationController.value != 1) {
          setState(() {
            isExpanded = true;
            animationController.forward();
          });
        } else {
          setState(() {
            isExpanded = false;
            animationController.reverse();
          });
        }
      },
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            decoration: widget.decoration,
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.title,
                Transform.rotate(
                  angle: (animationController.value * pi),
                  child: const Icon(Icons.keyboard_arrow_down_rounded),
                ),
              ],
            ),
          ),
          Visibility(
            visible: animationController.value != 0,
            child: Transform.scale(
              scaleY: animationController.value,
              alignment: Alignment.topCenter,
              child: Container(
                decoration: widget.decoration,
                margin: const EdgeInsets.only(top: 10),
                child: ListView(
                  shrinkWrap: true,
                  children: widget.children,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
