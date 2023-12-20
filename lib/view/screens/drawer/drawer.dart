// // ignore_for_file: avoid_print

// import '../../../helper/route_helper.dart';
// import '../../../theme/colorpalatt.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../../../controller/homenavcontroller/homenav_controller.dart';
// import '../../../util/buttons.dart';
// import '../../../util/constants.dart';
// import '../../../util/images.dart';
// import '../../../util/textstyles.dart';
// import '../../../util/tiles.dart';
// import '../../../util/userdatakeys.dart';

// class HomeDrawer extends StatefulWidget {
//   const HomeDrawer({super.key});

//   @override
//   State<HomeDrawer> createState() => _HomeDrawerState();
// }

// class _HomeDrawerState extends State<HomeDrawer> {
//   HomeNavController homeNavController = Get.put(HomeNavController());

//   // void _closeDrawer() {
//   //   Navigator.of(context).pop();
//   //   setState(() {
//   //     homeNavController.isDrawerOpen.value = false;
//   //   });
//   // }

//   var box = GetStorage();
//   late double h, w;

//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;
//     return Drawer(
//       width: w * .81,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: Stack(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//             child: Container(
//               height: double.infinity,
//               margin: EdgeInsets.only(right: w * .171),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(20),
//                     bottomRight: Radius.circular(20)),
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xff785FFB),
//                     Color(0xffAD46F2),
//                   ],
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(left: w * .042, top: h * .06),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InkWell(
//                           child: SvgPicture.asset(
//                               'assets/icons/cancel_drawer.svg',
//                               width: h * .03),
//                           onTap: () {
//                             // drawerVisible = false;
//                             // _closeDrawer();
//                           }),
//                       Padding(
//                         padding: EdgeInsets.only(left: w * .07, top: h * .04),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             textStyle(
//                                 box.read(UserData.name) ?? "", Palatt.white,
//                                 fontSize: w * .043,
//                                 fontWeight: FontWeight.bold),
//                             SizedBox(height: h * .007),
//                             textStyle(
//                                 box.read(UserData.phone) ?? "", Palatt.white,
//                                 fontSize: w * .04, fontWeight: FontWeight.w500),
//                           ],
//                         ),
//                       ),
//                       // SizedBox(height: h * .07),
//                       // drawerItems(
//                       //   homeNavController.drawerListData[0]['icon'],
//                       //   homeNavController.drawerListData[0]['title'],
//                       // ),
//                       // SizedBox(height: h * .025),
//                       // drawerItems(homeNavController.drawerListData[1]['icon'],
//                       //     homeNavController.drawerListData[1]['title']),
//                       // SizedBox(height: h * .025),
//                       // drawerItems(homeNavController.drawerListData[2]['icon'],
//                       //     homeNavController.drawerListData[2]['title']),
//                       // SizedBox(height: h * .025),
//                       // InkWell(
//                       //   onTap: () {
//                       //     // Get.to(() => const HelpNSupport(
//                       //     //       tabindex: 0,
//                       //     //     ));
//                       //   },
//                       //   child: drawerItems(
//                       //       homeNavController.drawerListData[3]['icon'],
//                       //       homeNavController.drawerListData[3]['title']),
//                       // ),
//                       // SizedBox(height: h * .025),
//                       // InkWell(
//                       //   onTap: () {
//                       //     // Get.to(() => TnC(
//                       //     //       heading: 'Terms and Conditions',
//                       //     //       index: 0,
//                       //     //     ));
//                       //   },
//                       //   child: drawerItems(
//                       //     homeNavController.drawerListData[4]['icon'],
//                       //     homeNavController.drawerListData[4]['title'],
//                       //   ),
//                       // ),
//                       // SizedBox(height: h * .025),
//                       // InkWell(
//                       //   onTap: () {
//                       //     // Get.to(() => TnC(
//                       //     //       heading: 'Privacy Policy',
//                       //     //       index: 1,
//                       //     //     ));
//                       //   },
//                       //   child: drawerItems(
//                       //       homeNavController.drawerListData[5]['icon'],
//                       //       homeNavController.drawerListData[5]['title']),
//                       // ),
//                       // SizedBox(height: h * .025),
//                       // drawerItems(homeNavController.drawerListData[6]['icon'],
//                       //     homeNavController.drawerListData[6]['title']),
//                       // SizedBox(height: h * .05),
//                       // Row(
//                       //   children: [
//                       //     Container(
//                       //       height: h * .001,
//                       //       width: w * .13,
//                       //       decoration: BoxDecoration(
//                       //           border: Border.all(
//                       //               color: Palatt.white, width: w * .0033)),
//                       //     ),
//                       //     SizedBox(width: w * .025),
//                       //     textStyle('Available on', Palatt.white,
//                       //         fontSize: w * .038, fontWeight: FontWeight.w500),
//                       //     SizedBox(width: w * .025),
//                       //     Container(
//                       //       height: h * .001,
//                       //       width: w * .13,
//                       //       decoration: BoxDecoration(
//                       //           border: Border.all(
//                       //               color: Palatt.white, width: w * .0033)),
//                       //     ),
//                       //   ],
//                       // ),
//                       // SizedBox(height: h * .028),
//                       Row(
//                         children: [
//                           SizedBox(width: w * .145),
//                           SvgPicture.asset('assets/icons/facebook-f.svg'),
//                           SizedBox(width: w * .06),
//                           SvgPicture.asset('assets/icons/instagram.svg'),
//                           SizedBox(width: w * .06),
//                           SvgPicture.asset('assets/icons/youtube.svg')
//                         ],
//                       ),
//                       SizedBox(height: h * .04),
//                       InkWell(
//                         child: Container(
//                           margin: EdgeInsets.only(left: w * .105),
//                           height: h * .052,
//                           width: w * .32,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               color: Palatt.white,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SvgPicture.asset('assets/icons/power_off.svg'),
//                               SizedBox(width: w * .02),
//                               textStyle("Sign Out", Palatt.black,
//                                   fontSize: w * .041,
//                                   fontWeight: FontWeight.w500),
//                             ],
//                           ),
//                         ),
//                         onTap: () {
//                           Get.dialog(Dialog(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                             child: SizedBox(
//                               width: w * .78,
//                               height: h * 0.15,
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.center,
//                                     height: h * .099,
//                                     child: textStyle(
//                                         'Do you want to logout?', Palatt.black,
//                                         fontSize: w * .042,
//                                         fontWeight: FontWeight.w900),
//                                   ),
//                                   // SizedBox(height: h * .01),
//                                   Container(
//                                     width: double.infinity,
//                                     height: h * .051,
//                                     decoration: BoxDecoration(
//                                         color: Palatt.primary,
//                                         border: Border.all(
//                                             color: Palatt.white,
//                                             width: w * .0011),
//                                         borderRadius: const BorderRadius.only(
//                                             bottomLeft: Radius.circular(8),
//                                             bottomRight: Radius.circular(8))),
//                                     child: Row(
//                                       // mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,

//                                       children: [
//                                         InkWell(
//                                           child: Container(
//                                               height: h * .05,
//                                               width: w * .38,
//                                               alignment: Alignment.center,
//                                               child: textStyle(
//                                                   'NO', Palatt.white,
//                                                   fontSize: w * .038,
//                                                   fontWeight: FontWeight.w500)),
//                                           onTap: () {
//                                             Navigator.of(context).pop();
//                                           },
//                                         ),
//                                         Container(
//                                           height: h * .048,
//                                           width: w * .001,
//                                           color: Palatt.white,
//                                         ),
//                                         InkWell(
//                                           child: Container(
//                                               height: h * .05,
//                                               width: w * .38,
//                                               alignment: Alignment.center,
//                                               child: textStyle(
//                                                   'YES', Palatt.white,
//                                                   fontSize: w * .038,
//                                                   fontWeight: FontWeight.w500)),
//                                           onTap: () {
//                                             // onLogout();
//                                             // Navigator.push(
//                                             //     context,
//                                             //     MaterialPageRoute(
//                                             //         builder: (context) =>
//                                             //             LoginAstro(
//                                             //               phone: '',
//                                             //             )));
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ));
//                         },
//                       ),
//                     ]),
//               ),
//             ),
//           ),
//           Positioned(
//             top: h * .0965,
//             left: w * .6,
//             child: Container(
//               height: 92,
//               width: 92,
//               transform: Matrix4.rotationZ(95.02),
//               padding: EdgeInsets.all(w * .02),
//               decoration: const BoxDecoration(
//                   borderRadius:
//                       BorderRadius.only(bottomLeft: Radius.circular(60)),
//                   color: Color(0xff825bf8),
//                   shape: BoxShape.rectangle),
//             ),
//           ),
//           Positioned(
//             top: h * .105,
//             left: w * .562,
//             child: SizedBox(
//               height: 118,
//               width: 88,
//               child: Container(
//                 // height: w * .1,
//                 // width: w * .1,
//                 padding: EdgeInsets.all(w * .02),
//                 decoration: const BoxDecoration(
//                   color: Color(0xff825bf8),
//                   shape: BoxShape.circle,
//                 ),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   backgroundImage: NetworkImage(box.read(UserData.image) ?? ""),
//                   onBackgroundImageError: (exception, stackTrace) {},
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: h * .135,
//             left: w * .572,
//             child: SvgPicture.asset('assets/icons/edit.svg'),
//           ),
//         ],
//       ),
//     );
//   }

//   Row drawerItems(String imagePath, String title) {
//     return Row(
//       children: [
//         SvgPicture.asset(imagePath),
//         SizedBox(width: w * .04),
//         textStyle(title, Palatt.white,
//             fontSize: w * .04, fontWeight: FontWeight.w500)
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../helper/route_helper.dart';
import '../../../theme/colorpalatt.dart';
import '../../../util/buttons.dart';
import '../../../util/constants.dart';
import '../../../util/images.dart';
import '../../../util/tiles.dart';
import '../../widgets/dialogs/logout.dart';
import '../../widgets/space.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 80.w,
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //   topRight: Radius.circular(10),
      //   bottomRight: Radius.circular(10),
      // )),

      elevation: 0,
      backgroundColor: Palatt.transparent,
      child: Stack(
        children: [
          Container(
            width: 75.0.h,
            margin: EdgeInsets.only(right: 10.w),
            decoration: const BoxDecoration(
                color: Palatt.primary,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: CustomCloseButton(
                        onTap: () => Get.back(),
                        backgroundColor: Palatt.white.withOpacity(0.3),
                        iconColor: Palatt.white,
                      ),
                    ),
                  ),
                  spaceVertical(10),
                  ListTile(
                    onTap: () {
                      // Get.toNamed(Routes.profile);
                    },
                    // leading: const CircleAvatar(
                    //   radius: 23,
                    //   backgroundImage: NetworkImage(
                    //     "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                    //   ),
                    // ),
                    title: const Text(
                      "Rohan Sharma",
                      style: TextStyle(
                        fontSize: 17,
                        color: Palatt.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: const Text(
                      "+91-7891023456",
                      style: TextStyle(
                        color: Palatt.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      children: [
                        // spaceVertical(10),
                        // DrawerTile(
                        //   image: AppImages.myorders,
                        //   title: "My Orders",
                        //   onTap: () {
                        //     Get.toNamed(Routes.myorders);
                        //   },
                        // ),
                        // spaceVertical(10),
                        // DrawerTile(
                        //   image: AppImages.blogs,
                        //   title: "Blogs",
                        //   onTap: () {},
                        // ),
                        // spaceVertical(10),
                        // DrawerTile(
                        //   image: AppImages.recargehistory,
                        //   title: "Recharge History",
                        //   onTap: () {
                        //     Get.toNamed(Routes.rechargeHistory);
                        //   },
                        // ),
                        // spaceVertical(10),
                        // DrawerTile(
                        //   image: AppImages.following,
                        //   title: "Following",
                        //   onTap: () {
                        //     Get.toNamed(Routes.following);
                        //   },
                        // ),
                        // spaceVertical(10),
                        // DrawerTile(
                        //   image: AppImages.refernearn,
                        //   title: "Refer and earn",
                        //   onTap: () {
                        //     Get.toNamed(Routes.refernearn);
                        //   },
                        // ),
                        // spaceVertical(10),
                        // DrawerTile(
                        //   image: AppImages.directoryofastro,
                        //   title: "Directory of Astro",
                        //   onTap: () {
                        //     Get.toNamed(Routes.directoryview);
                        //   },
                        // ),
                        // spaceVertical(10),
                        // DrawerTile(
                        //   image: AppImages.helpnsupport,
                        //   title: "Help & Support",
                        //   onTap: () {
                        //     Get.toNamed(Routes.helpnsupport);
                        //   },
                        // ),
                        // spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_earning,
                          title: "Earning History",
                          onTap: () {
                            Get.toNamed(Routes.earningHistory);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_review,
                          title: "Review",
                          onTap: () {
                            Get.toNamed(Routes.reviewsview);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.contactus,
                          title: "Contact us",
                          onTap: () {
                            Get.toNamed(Routes.contactUs);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_aboutus,
                          title: "About us",
                          onTap: () {
                            Get.toNamed(Routes.aboutus);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_followers,
                          title: "Followers",
                          onTap: () {
                            Get.toNamed(Routes.followersview);
                          },
                        ),

                        // spaceVertical(10),
                        // DrawerTile(
                        //   image: AppImages.aboutus,
                        //   title: "Help and Support",
                        //   onTap: () {
                        //     Get.toNamed(Routes.helpnsupport);
                        //   },
                        // ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_tnc,
                          title: "Terms and Conditions",
                          onTap: () {
                            Get.toNamed(Routes.termsncondition);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_pp,
                          title: "Privacy Policy",
                          onTap: () {
                            Get.toNamed(Routes.privacypolicy);
                          },
                        ),

                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_faq,
                          title: "FAQ",
                          onTap: () {
                            Get.toNamed(Routes.faqs);
                          },
                        ),
                        // spaceVertical(10),
                        // DrawerTile(
                        //   image: AppImages.faqs,
                        //   title: "FAQ's",
                        //   onTap: () {
                        //     Get.toNamed(Routes.);
                        //   },
                        //   showdivider: false,
                        // ),
                      ],
                    ),
                  ),
                  spaceVertical(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: socialmedialist
                        .map((e) => SocialMediabutton(
                            e["image"] ?? "", e["link"] ?? ""))
                        .toList(),
                  ),
                  spaceVertical(10),
                  RRButton2(
                      radius: 10,
                      height: 50,
                      onTap: () {},
                      backgroundColor: Palatt.white,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.power_settings_new,
                            color: Palatt.primary,
                          ),
                          spaceHorizontal(5),
                          const Text(
                            "Sign Out",
                            style: TextStyle(fontSize: 16, color: Palatt.black),
                          )
                        ],
                      )),
                  // EltdButton(
                  //   color: Palatt.white,
                  //   foregroundColor: Palatt.primary,
                  //   title: "Log Out",
                  //   height: 50,
                  //   width: 254,
                  //   radius: 10,
                  //   elevation: 0,
                  //   press: () => Get.dialog(const LogOut()),
                  // ),
                  spaceVertical(10),
                ],
              ),
            ),
          ),
          Positioned(
            top: 80,
            right: 0,
            // left: 70.0.w,
            child: SizedBox(
              height: 115,
              width: 84,
              // color: Palatt.boxShadow,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 40,
                    right: 40,
                    left: 0,
                    child: Container(
                      height: 100,
                      width: 100,
                      transform: Matrix4.rotationZ(0.785398),
                      color: Palatt.primary,
                      alignment: Alignment.center,
                      transformAlignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                    // top: 10,
                    bottom: 0,
                    right: 22,
                    // left: 0,
                    child: Container(
                      height: 100,
                      width: 100,
                      transform: Matrix4.rotationZ(0.785398),
                      color: Palatt.primary,
                      alignment: Alignment.center,
                      transformAlignment: Alignment.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 84,
                      width: 84,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Palatt.primary,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: const NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                        ),
                        onBackgroundImageError: (exception, stackTrace) {},
                      ),
                    ),
                  ),
                  Positioned(
                    // top: 90,
                    // right: 80,
                    top: 20,
                    left: 10,
                    child: SvgPicture.asset(
                      AppImages.edit,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
