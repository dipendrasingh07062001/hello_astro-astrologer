import 'dart:io';

import 'package:astro/util/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

late double h, w;

//list Titles with See All Or View All
Row listExpand(String title, String expand, BuildContext context, var classA) {
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          color: AppColor.colListTitle,
          height: w * .0025,
          fontSize: w * .043,
          fontWeight: FontWeight.bold,
        ),
      ),
      InkWell(
        child: Text(
          expand,
          style: TextStyle(
              color: AppColor.colPrimary,
              height: w * .0025,
              fontSize: w * .033,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationThickness: w * .005),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => classA),
          );
        },
      ),
    ],
  );
}

// Gradient button container

Container gradientContainer(
    double height, double width, double radius, Widget widget) {
  return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: AppColor.colPrimary
          // gradient: const LinearGradient(
          //   begin: Alignment(0, 2),
          //   end: Alignment(0, 0),
          //   stops: [.1, .9],
          //   colors: [
          //      Color(0xffEC6503),
          //     Color(0xffFFF200),
          //   ],
          // ),
          ),
      child: widget);
}

// method to quit app
showExitPopup() async {
  h = Get.height;
  w = Get.width;
  await Get.dialog(Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: SizedBox(
      width: w * .78,
      height: h * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: h * .099,
            child: textStyle('Do you want to Exit?'.tr, AppColor.colBlack,
                w * .042, FontWeight.w900),
          ),
          // SizedBox(height: h * .01),
          Container(
            width: double.infinity,
            height: h * .051,
            decoration: BoxDecoration(
                color: AppColor.colPrimary,
                border: Border.all(color: AppColor.colWhite, width: w * .0011),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                InkWell(
                  child: Container(
                      height: h * .05,
                      width: w * .38,
                      alignment: Alignment.center,
                      child: textStyle('NO'.tr, AppColor.colWhite, w * .038,
                          FontWeight.w500)),
                  onTap: () {
                    Get.back();

                    // Navigator.of(context).pop();
                  },
                ),
                Container(
                  height: h * .048,
                  width: w * .001,
                  color: AppColor.colWhite,
                ),
                InkWell(
                  child: Container(
                      height: h * .05,
                      width: w * .38,
                      alignment: Alignment.center,
                      child: textStyle('YES'.tr, AppColor.colWhite, w * .038,
                          FontWeight.w500)),
                  onTap: () {
                    exit(0);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ),
  ));
}

//on logout cache delete

// onLogout() async {
//   final box = GetStorage();
//   box.erase();
//   GoogleSignIn googleSignIn = GoogleSignIn();
//   await googleSignIn.signOut();
//   Get.offAll(() => LoginAstro(
//         phone: '',
//       ));
// }

// Exit dialog box for live video
Future<dynamic> exitLiveVideo(BuildContext context) {
  h = Get.height;
  w = Get.width;
  return showDialog(
    barrierColor: Colors.black26,
    context: context,
    builder: (context) => AlertDialog(
      elevation: 4,
      alignment: Alignment.center,
      actionsPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      content: Builder(builder: (context) {
        return SizedBox(
          width: w * .75,
          height: h * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              textStyle(
                  'Do you confirm that you leave \n                  this Live?',
                  AppColor.colBlack,
                  w * .042,
                  FontWeight.w800,
                  1.7),
              Container(
                width: double.infinity,
                height: h * .06,
                decoration: BoxDecoration(
                    color: AppColor.colPrimary,
                    border:
                        Border.all(color: AppColor.colWhite, width: w * .0011),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    InkWell(
                      child: Container(
                          height: h * .052,
                          width: w * .37,
                          alignment: Alignment.center,
                          child: textStyle('Resume', AppColor.colWhite,
                              w * .038, FontWeight.w500)),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomeNav(index: 0)));
                      },
                    ),
                    Container(
                      height: h * .058,
                      width: w * .001,
                      color: AppColor.colWhite,
                    ),
                    InkWell(
                      child: Container(
                          height: h * .052,
                          width: w * .37,
                          alignment: Alignment.center,
                          child: textStyle('Leave', AppColor.colWhite, w * .038,
                              FontWeight.w500)),
                      onTap: () {
                        Navigator.of(context).pop();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomeNav(index: 0)));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    ),
  );
}
