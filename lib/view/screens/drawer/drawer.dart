import 'package:astro/services/localization/keywords.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../helper/route_helper.dart';
import '../../../theme/colorpalatt.dart';
import '../../../util/buttons.dart';
import '../../../util/constants.dart';
import '../../../util/images.dart';
import '../../../util/tiles.dart';
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
                      children: [
                        DrawerTile(
                          image: AppImages.square_earning,
                          title: Words.EarningHistory.tr,
                          onTap: () {
                            Get.toNamed(Routes.earningHistory);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_review,
                          title: Words.Reviews.tr,
                          onTap: () {
                            Get.toNamed(Routes.reviewsview);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.contactus,
                          title: Words.ContactUs.tr,
                          onTap: () {
                            Get.toNamed(Routes.contactUs);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_aboutus,
                          title: Words.AboutUs.tr,
                          onTap: () {
                            Get.toNamed(Routes.aboutus);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_followers,
                          title: Words.Followers.tr,
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
                          title: Words.TermsNConditions.tr,
                          onTap: () {
                            Get.toNamed(Routes.termsncondition);
                          },
                        ),
                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_pp,
                          title: Words.PrivacyPolicy.tr,
                          onTap: () {
                            Get.toNamed(Routes.privacypolicy);
                          },
                        ),

                        spaceVertical(10),
                        DrawerTile(
                          image: AppImages.square_faq,
                          title: Words.FAQ.tr,
                          onTap: () {
                            Get.toNamed(Routes.faqs);
                          },
                        ),
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
                          Text(
                            Words.SignOut.tr,
                            style: const TextStyle(
                                fontSize: 16, color: Palatt.black),
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
