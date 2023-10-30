import 'package:astro/util/colors.dart';
import 'package:astro/util/extra_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageLoadingView extends StatelessWidget {
  bool isloading;
  Widget child;
  PageLoadingView({super.key, required this.child, required this.isloading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          child,
          Visibility(
            visible: isloading,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.colBlack.withOpacity(0.2),
              ),
              child: loader,
            ),
          )
        ],
      ),
    );
  }
}
