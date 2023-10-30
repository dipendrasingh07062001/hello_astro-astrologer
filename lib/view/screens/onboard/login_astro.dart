// ignore_for_file: use_build_context_synchronously, avoid_print, must_be_immutable

import 'package:astro/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../api/apiconstants.dart';
import '../../../controller/onboarding_controllers.dart';
import '../../../util/colors.dart';
import '../../../util/extra_widget.dart';
import '../../../util/images.dart';
import '../../../util/methods.dart';
import '../../../util/textstyles.dart';

class LoginAstro extends StatelessWidget {
  String phone;
  LoginAstro({
    Key? key,
    required this.phone,
  }) : super(key: key);

  OnboardingController onboardingController =
      Get.put(OnboardingController(), permanent: false);

  // bool isLoading = false;
  double h = Get.height, w = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.colWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.colWhite,
        centerTitle: true,
        title: textStyle(
            'Login Now', AppColor.colText1, w * .059, FontWeight.w500),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: double.infinity,
          // padding: EdgeInsets.symmetric(horizontal: w * .04),
          decoration: BoxDecoration(
            color: AppColor.colWhite,
            image: DecorationImage(
                image: AssetImage(AppImages.backgroundImage),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: h * .045,
                ),
                SvgPicture.asset('assets/images/login_astro.svg',
                    width: w * .65),
                Padding(
                  padding: EdgeInsets.only(
                      left: w * .042,
                      top: h * .04,
                      right: w * .09,
                      bottom: h * .024),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: textStyle('Please enter your phone number',
                        AppColor.colLabel, w * .041, FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: w * .042),
                  height: h * .063,
                  decoration: BoxDecoration(
                      color: AppColor.colWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xffebebeb),
                            blurRadius: 5,
                            spreadRadius: 3),
                      ]),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: onboardingController.mobileController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 10,
                    style: TextStyle(fontSize: w * .043),
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: TextStyle(
                          fontSize: w * .039, color: const Color(0xffa4a4a4)),
                      fillColor: Colors.transparent,
                      filled: true,
                      counterText: "",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: w * 0, color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: w * 0, color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * .03,
                ),
                // Row(
                //   children: [
                //     InkWell(
                //       child: Container(
                //         margin: EdgeInsets.only(left: w * .042),
                //         height: w * .055,
                //         width: w * .055,
                //         decoration: BoxDecoration(
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(2.5)),
                //             color: AppColor.colPrimary),
                //         child: Center(
                //           child: Obx(
                //             () => Visibility(
                //                 visible: onboardingController.isSelected.value
                //                     ? true
                //                     : false,
                //                 child: FittedBox(
                //                   child: Icon(
                //                     Icons.check_rounded,
                //                     color: AppColor.colWhite,
                //                   ),
                //                 )),
                //           ),
                //         ),
                //       ),
                //       onTap: () {
                //         onboardingController.isSelected.value =
                //             !onboardingController.isSelected.value;
                //       },
                //     ),
                //     SizedBox(
                //       width: w * .026,
                //     ),
                //     textStyle('I agree to the ', AppColor.colLabel, w * .043,
                //         FontWeight.w500),
                //     InkWell(
                //         child: Text(
                //           'Terms & Conditions',
                //           style: TextStyle(
                //               fontSize: w * .043,
                //               color: AppColor.colPrimary,
                //               fontWeight: FontWeight.w500,
                //               decoration: TextDecoration.underline),
                //         ),
                //         onTap: () => Get.toNamed(Routes.webview,
                //             arguments: {"link": ApiUrls.termsncondition})),
                //   ],
                // ),
                // SizedBox(
                //   height: h * .035,
                // ),
                Obx(
                  () => onboardingController.isLoading.value
                      ? loader
                      : InkWell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * .042),
                            child: gradientContainer(
                              h * .065,
                              double.infinity,
                              10,
                              textStyle('Continue', AppColor.colWhite, w * .043,
                                  FontWeight.bold),
                            ),
                          ),
                          onTap: () => onboardingController.onlogin(context),
                        ),
                ),
                // SizedBox(
                //   height: h * .024,
                // ),
                // textStyle('OR', AppColor.colPrimary, w * .039, FontWeight.w500),
                // SizedBox(
                //   height: h * .024,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // google login
                //     loginGFA(AppColor.colWhite, AppImages.iconGoogle),
                //     SizedBox(
                //       width: w * .08,
                //     ),
                //     // facebook login
                //     loginGFA(AppColor.colFbCircle, AppImages.iconFB),
                //   ],
                // ),
                Padding(
                  padding: EdgeInsets.only(
                      left: w * .026, top: h * .034, bottom: h * .026),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textStyle('Don\'t have an account? ', AppColor.colBlack,
                          w * .038, FontWeight.bold),
                      InkWell(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: w * .038,
                                color: AppColor.colPrimary,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            // Get.to(() => const Signup());
                            Get.toNamed(Routes.signup);
                            // Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //login page
  Widget loginGFA(Color color, String iconPath) {
    return InkWell(
      onTap: () {
        // onboardingController.googleLogin().then((value) {
        //   print("response google: $value");
        // });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        height: w * .137,
        width: w * .137,
        decoration:
            BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: AppColor.colGrey,
              blurRadius: 5,
              offset: const Offset(1, 0)),
        ]),
        child: SvgPicture.asset(
          iconPath,
        ),
      ),
    );
  }
}
