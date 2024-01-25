// ignore_for_file: avoid_print

import 'package:astro/controller/homecontroller/homecontroller.dart';
import 'package:astro/helper/route_helper.dart';
import 'package:astro/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/homenavcontroller/homenav_controller.dart';
import '../../../theme/colorpalatt.dart';
import '../../../util/methods.dart';
import '../../../util/textstyles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController(), permanent: false);
  double h = Get.height, w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 4,
          backgroundColor: Palatt.white,
          toolbarHeight: h * .09,
          leading: Padding(
            padding: EdgeInsets.only(bottom: h * .03),
            child: IconButton(
              icon: SvgPicture.asset(AppImages.feather),
              onPressed: controller.openDrawer,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * .0),
              textStyle('Hello Astrologer'.tr, Palatt.black,
                  fontSize: w * .046, fontWeight: FontWeight.bold),
              SizedBox(height: h * .007),
              textStyle('Find an Astrologer'.tr, Palatt.black,
                  fontSize: w * .04, fontWeight: FontWeight.w500)
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(bottom: h * .015, right: 15),
              child: InkWell(
                child: SvgPicture.asset(
                  AppImages.language,
                  height: 25,
                ),
                onTap: () {
                  Get.toNamed(Routes.languageview);
                  // Navigator.of(context).pop();

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => Language(
                  //               phone: GetStorage().read(UserData.phone),
                  //             ))));
                },
              ),
            )
          ],
        ),
        body: Obx(
          () => GridView.count(
              padding: EdgeInsets.only(
                  left: w * .015,
                  right: w * .015,
                  top: h * .032,
                  bottom: h * .1),
              crossAxisSpacing: w * .001,
              mainAxisSpacing: w * .001,
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children:
                  List.generate(controller.profileListData.length, (index) {
                var data = controller.profileListData[index];
                return Column(
                  children: [
                    InkWell(
                        child: Container(
                          height: w * .35,
                          width: w * .43,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(int.parse(data['color1'])),
                                Color(int.parse(data['color2'])),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(data['image']),
                              SizedBox(height: h * .01),
                              textStyle(data['title'].toString().tr.capitalize!,
                                  Palatt.white,
                                  fontSize: w * .048,
                                  fontWeight: FontWeight.bold,
                                  height: 1.8)
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(data["class"]);
                          // Get.to(() => data['klass']);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             data['klass']));
                        }),
                  ],
                );
              })),
        ));
  }
}


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var h = Get.height;
//   var w = Get.width;
//   final HomeController homeController =
//       Get.put<HomeController>(HomeController(), permanent: false);

//   @override
//   void initState() {
//     super.initState();
//   }

//   HomeNavController homeNavController =
//       Get.put(HomeNavController(), permanent: false);
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         showExitPopup();
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: Palatt.white,
//         appBar: AppBar(
//           elevation: 4,
//           backgroundColor: Palatt.white,
//           toolbarHeight: h * .09,
//           leading: Padding(
//             padding: EdgeInsets.only(bottom: h * .03),
//             child: IconButton(
//               icon: SvgPicture.asset(AppImages.menu),
//               onPressed: homeController.openDrawer(),
//             ),
//           ),
//           titleSpacing: 0,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: h * .0),
//               textStyle('HomeNavBinding'.tr, Palatt.black,
//                   fontSize: w * .046, fontWeight: FontWeight.bold),
//               SizedBox(height: h * .007),
//               textStyle('Find an Astrologer'.tr, Palatt.black,
//                   fontSize: w * .04, fontWeight: FontWeight.w500)
//             ],
//           ),
//           actions: [
//             Padding(
//               padding: EdgeInsets.only(bottom: h * .015),
//               child: InkWell(
//                 child: Image.asset(AppImages.language, scale: 1.3),
//                 onTap: () {
//                   // Navigator.of(context).pop();

//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: ((context) => Language(
//                   //               phone: GetStorage().read(UserData.phone),
//                   //             ))));
//                 },
//               ),
//             )
//           ],
//         ),
//         // body: Obx(
//         //   () => GridView.count(
//         //       padding: EdgeInsets.only(
//         //           left: w * .015,
//         //           right: w * .015,
//         //           top: h * .032,
//         //           bottom: h * .1),
//         //       crossAxisSpacing: w * .001,
//         //       mainAxisSpacing: w * .001,
//         //       crossAxisCount: 2,
//         //       childAspectRatio: 1.2,
//         //       shrinkWrap: true,
//         //       physics: const BouncingScrollPhysics(),
//         //       controller: scrollController,
//         //       children: List.generate(homeController.profileListData.length,
//         //           (index) {
//         //         var data = homeController.profileListData[index];
//         //         return Column(
//         //           children: [
//         //             InkWell(
//         //                 child: Container(
//         //                   height: w * .35,
//         //                   width: w * .43,
//         //                   decoration: BoxDecoration(
//         //                     borderRadius:
//         //                         const BorderRadius.all(Radius.circular(20)),
//         //                     gradient: LinearGradient(
//         //                       begin: Alignment.topCenter,
//         //                       end: Alignment.bottomCenter,
//         //                       colors: [
//         //                         Color(int.parse(data['color1'])),
//         //                         Color(int.parse(data['color2'])),
//         //                       ],
//         //                     ),
//         //                   ),
//         //                   child: Column(
//         //                     mainAxisAlignment: MainAxisAlignment.center,
//         //                     children: [
//         //                       SvgPicture.asset(data['image']),
//         //                       SizedBox(height: h * .01),
//         //                       textStyle(data['title'], Palatt.white,
//         //                           fontSize: w * .048,
//         //                           fontWeight: FontWeight.bold,
//         //                           height: 1.8)
//         //                     ],
//         //                   ),
//         //                 ),
//         //                 onTap: () {
//         //                   // Get.to(() => data['klass']);
//         //                   // Navigator.push(
//         //                   //     context,
//         //                   //     MaterialPageRoute(
//         //                   //         builder: (context) =>
//         //                   //             data['klass']));
//         //                 }),
//         //           ],
//         //         );
//         //       })),
//         // )
//       ),
//     );
//   }
// }
