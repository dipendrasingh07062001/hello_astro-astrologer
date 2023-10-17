// ignore_for_file: avoid_print

import 'package:astro/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../controller/homenavcontroller/homenav_controller.dart';
import '../../../util/textstyles.dart';
import '../../../util/userdatakeys.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  HomeNavController homeNavController = Get.put(HomeNavController());

  void _closeDrawer() {
    Navigator.of(context).pop();
    setState(() {
      homeNavController.isDrawerOpen.value = false;
    });
  }

  var box = GetStorage();
  late double h, w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Drawer(
      width: w * .81,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.only(right: w * .171),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff785FFB),
                    Color(0xffAD46F2),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: w * .042, top: h * .06),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          child: SvgPicture.asset(
                              'assets/icons/cancel_drawer.svg',
                              width: h * .03),
                          onTap: () {
                            // drawerVisible = false;
                            _closeDrawer();
                          }),
                      Padding(
                        padding: EdgeInsets.only(left: w * .07, top: h * .04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textStyle(box.read(UserData.name) ?? "",
                                AppColor.colWhite, w * .043, FontWeight.bold),
                            SizedBox(height: h * .007),
                            textStyle(box.read(UserData.phone) ?? "",
                                AppColor.colWhite, w * .04, FontWeight.w500),
                          ],
                        ),
                      ),
                      SizedBox(height: h * .07),
                      drawerItems(
                        homeNavController.drawerListData[0]['icon'],
                        homeNavController.drawerListData[0]['title'],
                      ),
                      SizedBox(height: h * .025),
                      drawerItems(homeNavController.drawerListData[1]['icon'],
                          homeNavController.drawerListData[1]['title']),
                      SizedBox(height: h * .025),
                      drawerItems(homeNavController.drawerListData[2]['icon'],
                          homeNavController.drawerListData[2]['title']),
                      SizedBox(height: h * .025),
                      InkWell(
                        onTap: () {
                          // Get.to(() => const HelpNSupport(
                          //       tabindex: 0,
                          //     ));
                        },
                        child: drawerItems(
                            homeNavController.drawerListData[3]['icon'],
                            homeNavController.drawerListData[3]['title']),
                      ),
                      SizedBox(height: h * .025),
                      InkWell(
                        onTap: () {
                          // Get.to(() => TnC(
                          //       heading: 'Terms and Conditions',
                          //       index: 0,
                          //     ));
                        },
                        child: drawerItems(
                          homeNavController.drawerListData[4]['icon'],
                          homeNavController.drawerListData[4]['title'],
                        ),
                      ),
                      SizedBox(height: h * .025),
                      InkWell(
                        onTap: () {
                          // Get.to(() => TnC(
                          //       heading: 'Privacy Policy',
                          //       index: 1,
                          //     ));
                        },
                        child: drawerItems(
                            homeNavController.drawerListData[5]['icon'],
                            homeNavController.drawerListData[5]['title']),
                      ),
                      SizedBox(height: h * .025),
                      drawerItems(homeNavController.drawerListData[6]['icon'],
                          homeNavController.drawerListData[6]['title']),
                      SizedBox(height: h * .05),
                      Row(
                        children: [
                          Container(
                            height: h * .001,
                            width: w * .13,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.colWhite,
                                    width: w * .0033)),
                          ),
                          SizedBox(width: w * .025),
                          textStyle('Available on', AppColor.colWhite, w * .038,
                              FontWeight.w500),
                          SizedBox(width: w * .025),
                          Container(
                            height: h * .001,
                            width: w * .13,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.colWhite,
                                    width: w * .0033)),
                          ),
                        ],
                      ),
                      SizedBox(height: h * .028),
                      Row(
                        children: [
                          SizedBox(width: w * .145),
                          SvgPicture.asset('assets/icons/facebook-f.svg'),
                          SizedBox(width: w * .06),
                          SvgPicture.asset('assets/icons/instagram.svg'),
                          SizedBox(width: w * .06),
                          SvgPicture.asset('assets/icons/youtube.svg')
                        ],
                      ),
                      SizedBox(height: h * .04),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(left: w * .105),
                          height: h * .052,
                          width: w * .32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.colWhite,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/power_off.svg'),
                              SizedBox(width: w * .02),
                              textStyle("Sign Out", AppColor.colBlack, w * .041,
                                  FontWeight.w500),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.dialog(Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: SizedBox(
                              width: w * .78,
                              height: h * 0.15,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: h * .099,
                                    child: textStyle(
                                        'Do you want to logout?',
                                        AppColor.colBlack,
                                        w * .042,
                                        FontWeight.w900),
                                  ),
                                  // SizedBox(height: h * .01),
                                  Container(
                                    width: double.infinity,
                                    height: h * .051,
                                    decoration: BoxDecoration(
                                        color: AppColor.colPrimary,
                                        border: Border.all(
                                            color: AppColor.colWhite,
                                            width: w * .0011),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8))),
                                    child: Row(
                                      // mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,

                                      children: [
                                        InkWell(
                                          child: Container(
                                              height: h * .05,
                                              width: w * .38,
                                              alignment: Alignment.center,
                                              child: textStyle(
                                                  'NO',
                                                  AppColor.colWhite,
                                                  w * .038,
                                                  FontWeight.w500)),
                                          onTap: () {
                                            Navigator.of(context).pop();
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
                                              child: textStyle(
                                                  'YES',
                                                  AppColor.colWhite,
                                                  w * .038,
                                                  FontWeight.w500)),
                                          onTap: () {
                                            // onLogout();
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             LoginAstro(
                                            //               phone: '',
                                            //             )));
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                        },
                      ),
                    ]),
              ),
            ),
          ),
          Positioned(
            top: h * .0965,
            left: w * .6,
            child: Container(
              height: 92,
              width: 92,
              transform: Matrix4.rotationZ(95.02),
              padding: EdgeInsets.all(w * .02),
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(60)),
                  color: Color(0xff825bf8),
                  shape: BoxShape.rectangle),
            ),
          ),
          Positioned(
            top: h * .105,
            left: w * .562,
            child: SizedBox(
              height: 118,
              width: 88,
              child: Container(
                // height: w * .1,
                // width: w * .1,
                padding: EdgeInsets.all(w * .02),
                decoration: const BoxDecoration(
                  color: Color(0xff825bf8),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(box.read(UserData.image) ?? ""),
                  onBackgroundImageError: (exception, stackTrace) {},
                ),
              ),
            ),
          ),
          Positioned(
            top: h * .135,
            left: w * .572,
            child: SvgPicture.asset('assets/icons/edit.svg'),
          ),
        ],
      ),
    );
  }

  Row drawerItems(String imagePath, String title) {
    return Row(
      children: [
        SvgPicture.asset(imagePath),
        SizedBox(width: w * .04),
        textStyle(title, AppColor.colWhite, w * .04, FontWeight.w500)
      ],
    );
  }
}
