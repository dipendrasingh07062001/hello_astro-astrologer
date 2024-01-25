// ignore_for_file: library_private_types_in_public_api

import 'package:astro/services/localization/keywords.dart';
import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/theme/themedata.dart';
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
          title: Words.services.tr.capitalize!,
          automaticallyImplyLeading: false),
      body: Column(children: [
        spaceVertical(15),
        service(AppImages.service_chat, Words.Chat, true),
        service(AppImages.service_call, Words.call, false),
        service(AppImages.service_calender, Words.Busy, false),
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
                Text(title.tr.capitalize!,
                    style: googleFontstyle(
                      const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Palatt.black,
                      ),
                    )),
              ],
            ),
            CustomSwitch(
              onChanged: (value) {},
              value: false,
            )
          ],
        ),
      );
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 54.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: !widget.value ? Palatt.grey : Palatt.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment: widget.value
                    ? ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerLeft
                        : Alignment.centerRight)
                    : ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerRight
                        : Alignment.centerLeft),
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
