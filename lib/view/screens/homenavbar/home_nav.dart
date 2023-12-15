// ignore_for_file: prefer_const_constructors, must_be_immutable, library_private_types_in_public_api, prefer_typing_uninitialized_variables, avoid_print

import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:astro/theme/themedata.dart';

import '../../../theme/colorpalatt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controller/homenavcontroller/homenav_controller.dart';
import '../../widgets/space.dart';
import '../Drawer/drawer.dart';
import '../home/home_page.dart';

class HomeNavBar extends GetView<HomeNavController> {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      extendBody: true,
      drawer: const HomeDrawer(),
      body: Obx(
        () => controller.body[controller.currentpage.value],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        height: 65,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Palatt.white,
            boxShadow: const [
              BoxShadow(
                color: Palatt.boxShadow,
                blurRadius: 12,
              )
            ]),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              4,
              (index) => TextButton(
                  onPressed: () => controller.ontapbaritem(index),
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          controller.bar[index]["image"] ?? "",
                          color: controller.currentpage.value == index
                              ? Palatt.primary
                              : Palatt.black,
                          height: 20,
                          width: 20,
                        ),
                        spaceVertical(5),
                        Text(
                          controller.bar[index]["name"] ?? "",
                          style: googleFontstyle(TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: controller.currentpage.value == index
                                ? Palatt.primary
                                : Palatt.black,
                          )),
                        )
                      ],
                    ),
                  ))),
          //  [

          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SvgPicture.asset(
          //         AppImages.home,
          //         color: Palatt.black,
          //         height: 20,
          //         width: 20,
          //       ),
          //       spaceVertical(5),
          //       Text(
          //         "Home",
          //         style: TextStyle(
          //           fontSize: 12,
          //           fontWeight: FontWeight.w500,
          //           color: Palatt.black,
          //         ),
          //       )
          //     ],
          //   ),
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SvgPicture.asset(
          //         AppImages.callicon,
          //         color: Palatt.black,
          //         height: 20,
          //         width: 20,
          //       ),
          //       spaceVertical(5),
          //       Text(
          //         "Call Astrologer",
          //         style: TextStyle(
          //           fontSize: 12,
          //           fontWeight: FontWeight.w500,
          //           color: Palatt.black,
          //         ),
          //       )
          //     ],
          //   ),
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SvgPicture.asset(
          //         AppImages.chaticon,
          //         color: Palatt.black,
          //         height: 20,
          //         width: 20,
          //       ),
          //       spaceVertical(5),
          //       Text(
          //         "Chat Astrologer",
          //         style: TextStyle(
          //           fontSize: 12,
          //           fontWeight: FontWeight.w500,
          //           color: Palatt.black,
          //         ),
          //       )
          //     ],
          //   ),
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SvgPicture.asset(
          //         AppImages.walletborder,
          //         color: Palatt.black,
          //         height: 20,
          //         width: 20,
          //       ),
          //       spaceVertical(5),
          //       Text(
          //         "Wallet",
          //         style: TextStyle(
          //           fontSize: 12,
          //           fontWeight: FontWeight.w500,
          //           color: Palatt.black,
          //         ),
          //       )
          //     ],
          //   ),
          // ],
        ),
      ),
    );
  }
}



// class HomeNav extends StatefulWidget {
//   const HomeNav({super.key});

//   @override
//   _HomeNavState createState() => _HomeNavState();
// }

// class _HomeNavState extends State<HomeNav> with WidgetsBindingObserver {
// //   @override
// //   void didChangeAppLifecycleState(AppLifecycleState state) {
// //     log(state.toString());
// //     if (state == AppLifecycleState.resumed) {
// // //online
// //       log("online");
// //       checkStatus();
// //       bookastrologerAppitment("1");
// //     } else {
// //       //offile
// //       bookastrologerAppitment("0");
// //       log("offline");
// //     }
// //   }

//   HomeNavController homeNavController =
//       Get.put(HomeNavController(), permanent: false);

//   @override
//   void initState() {
//     super.initState();
//     // getzegoaccountdata();
//     // addfcm();
//     // if (SplashScreen.ischatpending) {
//     //   Future.delayed(Duration(seconds: 1), () {
//     //     Get.to(() => ChatScreen(
//     //           id: SplashScreen.roomid,
//     //           currentOrdersModel: SplashScreen.model,
//     //         ));
//     //   });
//     // }
//     // WidgetsBinding.instance.addObserver(this);
//   }

//   double h = Get.height, w = Get.width;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const HomeDrawer(),
//       key: homeNavController.scaffoldKey,
//       backgroundColor: Palatt.white,
//       body: Obx(
//         () => homeNavController.widgets
//             .elementAt(homeNavController.currentIndex.value),
//       ),
//       extendBody: true,
//       onDrawerChanged: (isOpened) {
//         print(isOpened);
//         homeNavController.isDrawerOpen.value = isOpened;
//       },
//       bottomNavigationBar: Obx(
//         () => Container(
//           margin: EdgeInsets.symmetric(horizontal: w * .03, vertical: h * .02),
//           padding:
//               EdgeInsets.symmetric(horizontal: w * .008, vertical: h * .008),
//           decoration: BoxDecoration(
//               color: Palatt.white,
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: const [
//                 BoxShadow(
//                     color: Palatt.boxShadow,
//                     blurRadius: 5,
//                     offset: Offset(1, 0)),
//               ]),
//           child: BottomNavigationBar(
//               elevation: 0,
//               backgroundColor: Colors.transparent,
//               currentIndex: homeNavController.currentIndex.value,
//               type: BottomNavigationBarType.fixed,
//               showSelectedLabels: true,
//               selectedIconTheme: IconThemeData(color: Palatt.primary),
//               unselectedIconTheme: IconThemeData(color: Palatt.black),
//               selectedLabelStyle: TextStyle(
//                   fontSize: w * .03,
//                   color: Palatt.primary,
//                   fontWeight: FontWeight.bold),
//               unselectedLabelStyle: TextStyle(
//                   fontSize: w * .03,
//                   color: Palatt.black,
//                   fontWeight: FontWeight.bold),
//               selectedItemColor: Palatt.primary,
//               unselectedItemColor: Palatt.black,
//               onTap: homeNavController.onbottomIcontap,
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Padding(
//                     padding: EdgeInsets.only(bottom: h * .005),
//                     child: SvgPicture.asset('assets/icons/home_nav.svg',
//                         height: h * .023,
//                         color: homeNavController.currentIndex.value == 0
//                             ? Palatt.primary
//                             : Palatt.black
//                         // ColorFilter.mode(colPrimary, BlendMode.srcIn)
//                         // : ColorFilter.mode(colBlack, BlendMode.srcIn),
//                         ),
//                   ),
//                   // Icon(Icons.home_outlined,
//                   //     size: w * .08, color: homeNavController.currentIndex.value == 0 ? colPrimary : colBlack),
//                   label: "Home",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Padding(
//                     padding: EdgeInsets.only(bottom: h * .005),
//                     child: SvgPicture.asset('assets/icons/category_nav.svg',
//                         height: h * .026,
//                         color: homeNavController.currentIndex.value == 1
//                             ? Palatt.primary
//                             : Palatt.black
//                         //  ColorFilter.mode(colPrimary, BlendMode.srcIn)
//                         // : ColorFilter.mode(colBlack, BlendMode.srcIn),
//                         ),
//                   ),
//                   label: "Category",
//                 ),
//                 BottomNavigationBarItem(
//                     icon: Padding(
//                       padding: EdgeInsets.only(bottom: h * .005),
//                       child: SvgPicture.asset(
//                           'assets/icons/chatbubbles_nav.svg',
//                           height: h * .026,
//                           color: homeNavController.currentIndex.value == 2
//                               ? Palatt.primary
//                               : Palatt.black
//                           //  ColorFilter.mode(colPrimary, BlendMode.srcIn)
//                           // : ColorFilter.mode(colBlack, BlendMode.srcIn),
//                           ),
//                     ),
//                     label: "Chat"),
//                 BottomNavigationBarItem(
//                     icon: Padding(
//                       padding: EdgeInsets.only(bottom: h * .005),
//                       child: SvgPicture.asset('assets/icons/user_nav.svg',
//                           height: h * .026,
//                           color: homeNavController.currentIndex.value == 4
//                               ? Palatt.primary
//                               : Palatt.black
//                           // ColorFilter.mode(colPrimary, BlendMode.srcIn)
//                           // : ColorFilter.mode(colBlack, BlendMode.srcIn),
//                           ),
//                     ),
//                     label: "Profile")
//               ]),
//         ),
//       ),
//     );
//   }
// }
