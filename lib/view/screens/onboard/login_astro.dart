// ignore_for_file: use_build_context_synchronously, avoid_print, must_be_immutable

import 'package:astro/helper/route_helper.dart';
import 'package:astro/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding/onboarding_controllers.dart';
import '../../../theme/colorpalatt.dart';
import '../../../util/extra_widget.dart';
import '../../../util/images.dart';
import '../../../util/methods.dart';
import '../../../util/textstyles.dart';
import '../../widgets/backgroundimages.dart';

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
    return Container(
      decoration: const BoxDecoration(
        color: Palatt.white,
        image: DecorationImage(
            image: AssetImage(AppImages.background),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth),
      ),
      child: Scaffold(
        backgroundColor: Palatt.transparent,
        appBar: AppBar(
          elevation: 0,
          leading: ModalRoute.of(context)?.canPop == true
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: w * .075,
                    // color: colBlack,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : null,
          centerTitle: true,
          title: textStyle('Login Now', Palatt.black,
              fontSize: w * .058, fontWeight: FontWeight.w500),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: h * .045,
                ),
                SvgPicture.asset(AppImages.login, width: w * .65),
                Padding(
                  padding: EdgeInsets.only(
                      top: h * .04, right: w * .09, bottom: h * .024, left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: textStyle('Please enter your phone number',
                        Palatt.blacklightshade,
                        fontSize: w * .041, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                      color: Palatt.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Palatt.boxShadow,
                          blurRadius: 5,
                          offset: Offset(-1, 2),
                        ),
                      ]),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    cursorHeight: 20,
                    controller: onboardingController.mobileController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {},
                    style: TextStyle(fontSize: w * .043),
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      // isDense: true,
                      isCollapsed: true,
                      constraints: const BoxConstraints(minHeight: 50),
                      contentPadding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
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

                // Container(
                //   height: h * .063,
                //   decoration: const BoxDecoration(
                //       color: Palatt.white,
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Palatt.boxShadow,
                //           blurRadius: 5,
                //           offset: Offset(-1, 2),
                //         ),
                //       ]),
                //   child: TextFormField(
                //     keyboardType: TextInputType.number,
                //     maxLength: 10,
                //     // controller: onboardingController.phoneController,
                //     inputFormatters: [
                //       FilteringTextInputFormatter.digitsOnly
                //     ],
                //     onChanged: (value) {},
                //     style: TextStyle(fontSize: w * .043),
                //     decoration: InputDecoration(
                //       hintText: 'Phone number',
                //       hintStyle: TextStyle(
                //           fontSize: w * .039,
                //           color: const Color(0xffa4a4a4)),
                //       fillColor: Colors.transparent,
                //       filled: true,
                //       counterText: "",
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //             width: w * 0, color: Colors.transparent),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(10.0)),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //             width: w * 0, color: Colors.transparent),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(10.0)),
                //       ),
                //       focusedErrorBorder: const UnderlineInputBorder(
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //       errorBorder: const UnderlineInputBorder(
                //         borderSide: BorderSide(color: Colors.transparent),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: h * .02,
                ),
                Row(
                  children: [
                    spaceHorizontal(15),
                    SizedBox(
                      width: w * .05,
                      child: Transform.scale(
                        scale: w * .003,
                        child: Checkbox(
                          activeColor: Palatt.primary,
                          value: true,
                          onChanged: (value) {
                            // setState(() {
                            //   onboardingController.val = value!;
                            // });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * .026,
                    ),
                    textStyle('I agree to the ', Palatt.blacklightshade,
                        fontSize: w * .043, fontWeight: FontWeight.w500),
                    InkWell(
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                              fontSize: w * .043,
                              color: Palatt.primary,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () =>
                            'https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                  ],
                ),
                SizedBox(
                  height: h * .03,
                ),
                Obx(
                  () => onboardingController.isLoading.value == true
                      ? loader
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Palatt.primary,
                            minimumSize: Size(w * .94, h * .065),
                            maximumSize: Size(w * .94, h * .065),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.otpverification);
                          },
                          // onboardingController.ontapContinue(context),
                          child: textStyle('Continue', Palatt.white,
                              fontSize: w * .04, fontWeight: FontWeight.w500),
                        ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),

                // textStyle('OR', Palatt.primary,
                //     fontSize: w * .039, fontWeight: FontWeight.w500),
                // const SizedBox(
                //   height: 10,
                // ),
                Padding(
                    padding: EdgeInsets.only(
                        left: w * .026, top: h * .034, bottom: h * .026),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textStyle('Don\'t have an account? ', Palatt.black,
                              fontSize: w * .038, fontWeight: FontWeight.w500),
                          InkWell(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: w * .038,
                                    color: Palatt.primary,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              onTap: () {
                                // Get.to(() => const Signup());
                                Get.toNamed(Routes.signup);
                                // Navigator.of(context).pop();
                              }),
                        ])),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //       backgroundColor: Palatt.white,
                //       minimumSize: Size(w * .94, h * .065),
                //       maximumSize: Size(w * .94, h * .065),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //         side: const BorderSide(color: Palatt.primary),
                //       ),
                //       elevation: 0),
                //   onPressed: () {},
                //   child: textStyle('Log in as guest', Palatt.primary,
                //       fontSize: w * .04, fontWeight: FontWeight.w500),
                // ),
              ],
            ),
          ),
        ),
      ),
    );

    // Scaffold(
    //   resizeToAvoidBottomInset: true,
    //   backgroundColor: Palatt.white,
    //   appBar: AppBar(
    //     elevation: 0,
    //     backgroundColor: Palatt.white,
    //     centerTitle: true,
    //     title: textStyle('Login Now', Palatt.black, w * .059, FontWeight.w500),
    //   ),
    //   body: GestureDetector(
    //     onTap: () {
    //       FocusScope.of(context).requestFocus(FocusNode());
    //     },
    //     child: Container(
    //       height: double.infinity,
    //       // padding: EdgeInsets.symmetric(horizontal: w * .04),
    //       decoration: const BoxDecoration(
    //         color: Palatt.white,
    //         image: DecorationImage(
    //             image: AssetImage(AppImages.background),
    //             alignment: Alignment.bottomCenter,
    //             fit: BoxFit.fitWidth),
    //       ),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             SizedBox(
    //               height: h * .045,
    //             ),
    //             SvgPicture.asset(
    //               AppImages.login,
    //               width: w * .65,
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(
    //                   left: w * .042,
    //                   top: h * .04,
    //                   right: w * .09,
    //                   bottom: h * .024),
    //               child: Align(
    //                 alignment: Alignment.centerLeft,
    //                 child: textStyle('Please enter your phone number',
    //                     Palatt.greyshadedark, w * .041, FontWeight.w500),
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.symmetric(horizontal: w * .042),
    //               height: h * .063,
    //               decoration: const BoxDecoration(
    //                   color: Palatt.white,
    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
    //                   boxShadow: [
    //                     BoxShadow(
    //                         color: Color(0xffebebeb),
    //                         blurRadius: 5,
    //                         spreadRadius: 3),
    //                   ]),
    //               child: TextFormField(
    //                 keyboardType: TextInputType.number,
    //                 controller: onboardingController.mobileController,
    //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    //                 maxLength: 10,
    //                 style: TextStyle(fontSize: w * .043),
    //                 decoration: InputDecoration(
    //                   hintText: 'Phone number',
    //                   hintStyle: TextStyle(
    //                       fontSize: w * .039, color: const Color(0xffa4a4a4)),
    //                   fillColor: Colors.transparent,
    //                   filled: true,
    //                   counterText: "",
    //                   focusedBorder: OutlineInputBorder(
    //                     borderSide:
    //                         BorderSide(width: w * 0, color: Colors.transparent),
    //                     borderRadius:
    //                         const BorderRadius.all(Radius.circular(10.0)),
    //                   ),
    //                   enabledBorder: OutlineInputBorder(
    //                     borderSide:
    //                         BorderSide(width: w * 0, color: Colors.transparent),
    //                     borderRadius:
    //                         const BorderRadius.all(Radius.circular(10.0)),
    //                   ),
    //                   focusedErrorBorder: const UnderlineInputBorder(
    //                     borderSide: BorderSide(color: Colors.transparent),
    //                   ),
    //                   errorBorder: const UnderlineInputBorder(
    //                     borderSide: BorderSide(color: Colors.transparent),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               height: h * .03,
    //             ),
    //             // Row(
    //             //   children: [
    //             //     InkWell(
    //             //       child: Container(
    //             //         margin: EdgeInsets.only(left: w * .042),
    //             //         height: w * .055,
    //             //         width: w * .055,
    //             //         decoration: BoxDecoration(
    //             //             borderRadius:
    //             //                 BorderRadius.all(Radius.circular(2.5)),
    //             //             color: Palatt.primary),
    //             //         child: Center(
    //             //           child: Obx(
    //             //             () => Visibility(
    //             //                 visible: onboardingController.isSelected.value
    //             //                     ? true
    //             //                     : false,
    //             //                 child: FittedBox(
    //             //                   child: Icon(
    //             //                     Icons.check_rounded,
    //             //                     color: Palatt.white,
    //             //                   ),
    //             //                 )),
    //             //           ),
    //             //         ),
    //             //       ),
    //             //       onTap: () {
    //             //         onboardingController.isSelected.value =
    //             //             !onboardingController.isSelected.value;
    //             //       },
    //             //     ),
    //             //     SizedBox(
    //             //       width: w * .026,
    //             //     ),
    //             //     textStyle('I agree to the ', AppColor.colLabel, w * .043,
    //             //         FontWeight.w500),
    //             //     InkWell(
    //             //         child: Text(
    //             //           'Terms & Conditions',
    //             //           style: TextStyle(
    //             //               fontSize: w * .043,
    //             //               color: Palatt.primary,
    //             //               fontWeight: FontWeight.w500,
    //             //               decoration: TextDecoration.underline),
    //             //         ),
    //             //         onTap: () => Get.toNamed(Routes.webview,
    //             //             arguments: {"link": ApiUrls.termsncondition})),
    //             //   ],
    //             // ),
    //             // SizedBox(
    //             //   height: h * .035,
    //             // ),
    //             Obx(
    //               () => onboardingController.isLoading.value
    //                   ? loader
    //                   : InkWell(
    //                       child: Padding(
    //                         padding: EdgeInsets.symmetric(horizontal: w * .042),
    //                         child: gradientContainer(
    //                           h * .065,
    //                           double.infinity,
    //                           10,
    //                           textStyle('Continue', Palatt.white, w * .043,
    //                               FontWeight.bold),
    //                         ),
    //                       ),
    //                       onTap: () => onboardingController.onlogin(context),
    //                     ),
    //             ),
    //             // SizedBox(
    //             //   height: h * .024,
    //             // ),
    //             // textStyle('OR', Palatt.primary, w * .039, FontWeight.w500),
    //             // SizedBox(
    //             //   height: h * .024,
    //             // ),
    //             // Row(
    //             //   mainAxisAlignment: MainAxisAlignment.center,
    //             //   children: [
    //             //     // google login
    //             //     loginGFA(Palatt.white, AppImages.iconGoogle),
    //             //     SizedBox(
    //             //       width: w * .08,
    //             //     ),
    //             //     // facebook login
    //             //     loginGFA(AppColor.colFbCircle, AppImages.iconFB),
    //             //   ],
    //             // ),
    //             Padding(
    //               padding: EdgeInsets.only(
    //                   left: w * .026, top: h * .034, bottom: h * .026),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   textStyle('Don\'t have an account? ', Palatt.black,
    //                       w * .038, FontWeight.bold),
    //                   InkWell(
    //                       child: Text(
    //                         'Sign up',
    //                         style: TextStyle(
    //                             fontSize: w * .038,
    //                             color: Palatt.primary,
    //                             fontWeight: FontWeight.bold,
    //                             decoration: TextDecoration.underline),
    //                       ),
    //                       onTap: () {
    //                         // Get.to(() => const Signup());
    //                         Get.toNamed(Routes.signup);
    //                         // Navigator.of(context).pop();
    //                       }),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  color: Palatt.grey, blurRadius: 5, offset: Offset(1, 0)),
            ]),
        child: SvgPicture.asset(
          iconPath,
        ),
      ),
    );
  }
}
