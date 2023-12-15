// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:astro/api/apiconstants.dart';
import 'package:astro/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding/onboarding_controllers.dart';
import '../../../data/model/expertise_model.dart';
import '../../../theme/colorpalatt.dart';
import '../../../util/extra_widget.dart';
import '../../../util/images.dart';
import '../../../util/methods.dart';
import '../../../util/textstyles.dart';
import 'login_astro.dart';

String mobNumber = '';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

// <Map<String, dynamic>>
class _SignupState extends State<Signup> {
  OnboardingController onboardingController =
      Get.put(OnboardingController(), permanent: false);

  late double h, w;
  bool isSelected = false;

  bool onTapped = false;
  bool onTappedLang = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    onboardingController.emailController.clear();
    onboardingController.mobileController.clear();
    onboardingController.nameController.clear();
    onboardingController.expController.clear();
    onboardingController.cityController.clear();
    onboardingController.countryController.clear();
    onboardingController.systemController.clear();
    onboardingController.bioController.clear();
    onboardingController.languageController.clear();
    onboardingController.gender = 'Gender';
    // onboardingController.email = "";
    onboardingController.filePath.value = '';
    // onboardingController.getexpertisedata();

    // onboardingController.getLanguage();
    onboardingController.emailController.text =
        onboardingController.email == null ||
                onboardingController.email!.isNotEmpty
            ? onboardingController.email ?? ""
            : "";
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

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
          elevation: 4,
          backgroundColor: Palatt.white,
          toolbarHeight: h * .08,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: textStyle('Sign Up', Palatt.black,
              fontSize: w * .059, fontWeight: FontWeight.bold),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                SizedBox(
                  height: h * .025,
                ),
                // GestureDetector(
                //   onTap: () => setState(() {
                //     onboardingController.pickprofilepick();
                //   }),
                //   child: SizedBox(
                //       height: 150,
                //       width: 150,
                //       child: Stack(
                //         children: [
                //           onboardingController.getprofileImage(),
                //           Positioned(
                //             right: 10,
                //             bottom: 10,
                //             child: SvgPicture.network(
                //               AppImages.editicon,
                //               height: 30,
                //               width: 30,
                //             ),
                //           ),
                //         ],
                //       )),
                // ),
                signupTextForm('Full Name', TextInputType.name,
                    onboardingController.nameController,
                    nonEditable: true,
                    maxLength: null,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ]),
                signupTextForm('Gender', TextInputType.name,
                    onboardingController.nameController,
                    maxLength: null,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ]),

                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       onTapped = !onTapped;
                //     });
                //   },
                //   child: Container(
                //       height: h * .063,
                //       width: double.infinity,
                //       padding: EdgeInsets.only(left: w * .042),
                //       margin: EdgeInsets.only(
                //           left: w * .042,
                //           right: w * .042,
                //           top: h * .01,
                //           bottom: h * .01),
                //       decoration: BoxDecoration(
                //           color: Palatt.white,
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(13)),
                //           boxShadow: const [
                //             BoxShadow(
                //                 color: Color(0xffebebeb),
                //                 blurRadius: 5,
                //                 spreadRadius: 3),
                //           ]),
                //       child: Align(
                //         alignment: Alignment.centerLeft,
                //         child: textStyle(
                //             onboardingController.gender,
                //             onboardingController.gender == 'Gender'
                //                 ? const Color(0xffa4a4a4)
                //                 : Palatt.black,
                //             w * .04,
                //             onboardingController.gender == 'Gender'
                //                 ? FontWeight.w500
                //                 : FontWeight.bold),
                //       )),
                // ),
                // Visibility(
                //   visible: onTapped,
                //   child: Container(
                //       // height: h * .063,
                //       width: double.infinity,
                //       padding: EdgeInsets.only(
                //           left: w * .042,
                //           right: w * .042,
                //           top: h * .01,
                //           bottom: h * .0),
                //       margin: EdgeInsets.only(
                //           left: w * .042,
                //           right: w * .042,
                //           top: h * .01,
                //           bottom: h * .01),
                //       decoration: BoxDecoration(
                //           color: Palatt.white,
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(13)),
                //           boxShadow: const [
                //             BoxShadow(
                //                 color: Color(0xffebebeb),
                //                 blurRadius: 5,
                //                 spreadRadius: 3),
                //           ]),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {});
                //               onboardingController.gender = 'Male';
                //               onTapped = !onTapped;
                //             },
                //             child: SizedBox(
                //               height: h * .05,
                //               width: double.infinity,
                //               child: textStyle('Male', Palatt.black,
                //                   w * .04, FontWeight.bold),
                //             ),
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {});
                //               onboardingController.gender = 'Female';
                //               onTapped = !onTapped;
                //             },
                //             child: SizedBox(
                //               height: h * .04,
                //               width: double.infinity,
                //               child: textStyle('Female', Palatt.black,
                //                   w * .04, FontWeight.bold),
                //             ),
                //           ),
                //         ],
                //       )),
                // ),
                signupTextForm('Mobile No.', TextInputType.phone,
                    onboardingController.mobileController,
                    nonEditable: true,
                    maxLength: 10,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                signupTextForm('Email ID', TextInputType.emailAddress,
                    onboardingController.emailController),
                signupTextForm('Experience in years', TextInputType.number,
                    onboardingController.expController,
                    nonEditable: true,
                    maxLength: 2,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
                // signupTextForm('City', TextInputType.text,
                //     onboardingController.cityController),
                // signupTextForm('Country', TextInputType.text,
                //     onboardingController.countryController),
                // signupTextForm('System Known', TextInputType.text,
                //     onboardingController.systemController),
                GestureDetector(
                  onTap: onboardingController.showhideexpertise,
                  child: Container(
                      height: h * .063,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: w * .042),
                      margin: EdgeInsets.only(
                          left: w * .042,
                          right: w * .042,
                          top: h * .01,
                          bottom: h * .01),
                      decoration: const BoxDecoration(
                          color: Palatt.white,
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffebebeb),
                                blurRadius: 5,
                                spreadRadius: 3),
                          ]),
                      child: Obx(
                        () => Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textStyle(
                                  onboardingController.selectedexpertise.value!
                                          .name!.isEmpty
                                      ? "My Expertise"
                                      : onboardingController
                                              .selectedexpertise.value!.name ??
                                          "",
                                  onboardingController.selectedexpertise.value!
                                          .name!.isEmpty
                                      ? const Color(0xffa4a4a4)
                                      : Palatt.black,
                                  fontSize: w * .04,
                                  fontWeight: FontWeight.w400),
                              const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Palatt.grey,
                                  ))
                            ],
                          ),
                        ),
                      )),
                ),
                Obx(
                  () => Visibility(
                      visible: onboardingController.showexpertise.value,
                      child: Column(
                        children: List.generate(
                            onboardingController.expertiselist.length, (index) {
                          ExpertiseModel model =
                              onboardingController.expertiselist[index];
                          return GestureDetector(
                            onTap: () =>
                                onboardingController.onexpertisetap(model),
                            child: SizedBox(
                                height: h * .05,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    checkBoxContainer(model.name ==
                                        onboardingController
                                            .selectedexpertise.value!.name),
                                    SizedBox(width: w * .04),
                                    textStyle(model.name ?? "", Palatt.black,
                                        fontSize: w * .04,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                  ],
                                )),
                          );
                        }),
                      )),
                ),

                signupTextForm(
                  'My Qualifications',
                  TextInputType.text,
                  onboardingController.qualificationsController,
                ),
                signupTextForm(
                  'City',
                  TextInputType.text,
                  onboardingController.cityController,
                ),
                signupTextForm(
                  'State',
                  TextInputType.text,
                  onboardingController.stateController,
                ),
                GestureDetector(
                  onTap: onboardingController.showhideexpertise,
                  child: Container(
                      height: h * .063,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: w * .042),
                      margin: EdgeInsets.only(
                          left: w * .042,
                          right: w * .042,
                          top: h * .01,
                          bottom: h * .01),
                      decoration: const BoxDecoration(
                          color: Palatt.white,
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffebebeb),
                                blurRadius: 5,
                                spreadRadius: 3),
                          ]),
                      child: Obx(
                        () => Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textStyle(
                                  onboardingController.selectedexpertise.value!
                                          .name!.isEmpty
                                      ? "Language"
                                      : onboardingController
                                              .selectedexpertise.value!.name ??
                                          "",
                                  onboardingController.selectedexpertise.value!
                                          .name!.isEmpty
                                      ? const Color(0xffa4a4a4)
                                      : Palatt.black,
                                  fontSize: w * .04,
                                  fontWeight: FontWeight.w400),
                              const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Palatt.grey,
                                  ))
                            ],
                          ),
                        ),
                      )),
                ),

                GestureDetector(
                  onTap: onboardingController.showhideexpertise,
                  child: Container(
                      height: h * .063,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: w * .042),
                      margin: EdgeInsets.only(
                          left: w * .042,
                          right: w * .042,
                          top: h * .01,
                          bottom: h * .01),
                      decoration: const BoxDecoration(
                          color: Palatt.white,
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffebebeb),
                                blurRadius: 5,
                                spreadRadius: 3),
                          ]),
                      child: Obx(
                        () => Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textStyle(
                                  onboardingController.selectedexpertise.value!
                                          .name!.isEmpty
                                      ? "Availability Day/Timing"
                                      : onboardingController
                                              .selectedexpertise.value!.name ??
                                          "",
                                  onboardingController.selectedexpertise.value!
                                          .name!.isEmpty
                                      ? const Color(0xffa4a4a4)
                                      : Palatt.black,
                                  fontSize: w * .04,
                                  fontWeight: FontWeight.w400),
                              const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.access_time_rounded,
                                    color: Palatt.grey,
                                  ))
                            ],
                          ),
                        ),
                      )),
                ),
                signupTextForm(
                  'PAN Number',
                  TextInputType.text,
                  onboardingController.panController,
                ),
                signupTextForm(
                  'GST Number',
                  TextInputType.text,
                  onboardingController.panController,
                ),
                signupTextForm(
                  'Consultancy Charges Per Minute',
                  TextInputType.text,
                  onboardingController.panController,
                ),
                signupTextForm(
                  'Profile Bio(Multiple language)',
                  TextInputType.text,
                  onboardingController.panController,
                ),
                GestureDetector(
                  onTap: onboardingController.showhideexpertise,
                  child: Container(
                      height: h * .063,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: w * .042),
                      margin: EdgeInsets.only(
                          left: w * .042,
                          right: w * .042,
                          top: h * .01,
                          bottom: h * .01),
                      decoration: const BoxDecoration(
                          color: Palatt.white,
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffebebeb),
                                blurRadius: 5,
                                spreadRadius: 3),
                          ]),
                      child: Obx(
                        () => Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textStyle(
                                  onboardingController.selectedexpertise.value!
                                          .name!.isEmpty
                                      ? "Upload PAN Card"
                                      : onboardingController
                                              .selectedexpertise.value!.name ??
                                          "",
                                  onboardingController.selectedexpertise.value!
                                          .name!.isEmpty
                                      ? const Color(0xffa4a4a4)
                                      : Palatt.black,
                                  fontSize: w * .04,
                                  fontWeight: FontWeight.w400),
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SvgPicture.asset(
                                    AppImages.upload,
                                    height: 15,
                                    width: 30,
                                  ))
                            ],
                          ),
                        ),
                      )),
                ),

                // Select Language
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       onTappedLang = !onTappedLang;
                //     });
                //   },
                //   child: signupTextForm('Language', TextInputType.text,
                //       onboardingController.languageController,
                //       nonEditable: false),
                // ),
                // Visibility(
                //   visible: onTappedLang,
                //   child: Container(
                //     // height: h * .063,
                //     width: double.infinity,
                //     padding: EdgeInsets.only(
                //         left: w * .042,
                //         right: w * .042,
                //         top: h * .01,
                //         bottom: h * .0),
                //     margin: EdgeInsets.only(
                //         left: w * .042,
                //         right: w * .042,
                //         top: h * .01,
                //         bottom: h * .01),
                //     decoration: BoxDecoration(
                //         color: Palatt.white,
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(13)),
                //         boxShadow: const [
                //           BoxShadow(
                //               color: Color(0xffebebeb),
                //               blurRadius: 5,
                //               spreadRadius: 3),
                //         ]),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: List.generate(
                //         onboardingController.languageList.length,
                //         (index) => GestureDetector(
                //           onTap: () {
                //             print('start');
                //             print(onboardingController.languageList);
                //             setState(() {
                //               onboardingController
                //                       .languageList[index].isSelected =
                //                   !onboardingController
                //                       .languageList[index].isSelected;
                //               onboardingController.languageController.text =
                //                   onboardingController.languageList
                //                       .where((p0) => p0.isSelected)
                //                       .map((e) => e.language)
                //                       .toList()
                //                       .join(', ');
                //               // onboardingController.language
                //               //     .where((element) => element["isSelected"])
                //               //     .map((e) => e["language"])
                //               //     .toList()
                //               //     .join(", ")
                //               // ;
                //             });
                //             print(onboardingController.languageList
                //                 .where((p0) => p0.isSelected)
                //                 .map((e) => e.language)
                //                 .toList()
                //                 .join(', '));
                //           },
                //           child: SizedBox(
                //             height: h * .05,
                //             width: double.infinity,
                //             child: Row(
                //               children: [
                //                 checkBoxContainer(onboardingController
                //                     .languageList[index].isSelected),
                //                 SizedBox(width: w * .04),
                //                 textStyle(
                //                     onboardingController
                //                         .languageList[index].language
                //                         .toString(),
                //                     Palatt.black,
                //                     w * .04,
                //                     FontWeight.bold),
                //                 const Spacer(),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // signupTextForm(
                //   'Short Bio',
                //   TextInputType.multiline,
                //   onboardingController.bioController,
                //   isDense: true,
                //   maxLines: 2,
                // ),
                InkWell(
                  // onTap: onboardingController.pickcertificat,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        bottom: h * .02,
                        top: h * .02,
                        left: w * .042,
                        right: w * .042),
                    margin: EdgeInsets.only(
                        left: w * .042,
                        right: w * .042,
                        top: h * .005,
                        bottom: h * .01),
                    decoration: const BoxDecoration(
                        color: Palatt.white,
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffebebeb),
                              blurRadius: 5,
                              spreadRadius: 3),
                        ]),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          // 'assets/icons/upload.svg',
                          AppImages.upload,
                          // color: AppColor.colSrchIcon,
                          colorFilter: const ColorFilter.mode(
                              const Color(0xffa4a4a4), BlendMode.srcIn),
                          width: w * .17,
                        ),
                        Obx(() => textStyle(
                            onboardingController.filePath.value.isEmpty
                                ? "Multiple Photo"
                                : onboardingController.filePath.value,
                            const Color(0xffa4a4a4),
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: h * .02,
                ),
                // Row(
                //   children: [
                //     // SizedBox(width: w * .032),
                //     InkWell(
                //       child: checkBoxContainer(
                //           onboardingController.directoryselected.value),
                //       onTap: () {
                //         setState(() {
                //           onboardingController.directoryselected.value = true;
                //         });
                //       },
                //     ),
                //     SizedBox(
                //       width: w * .026,
                //     ),
                //     textStyle('Profile listing in directory', Palatt.grey,
                //         fontSize: w * .043, fontWeight: FontWeight.w500),
                //   ],
                // ),
                // SizedBox(
                //   height: h * .02,
                // ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     // SizedBox(width: w * .032),
                //     InkWell(
                //       child: checkBoxContainer(
                //           !onboardingController.directoryselected.value),
                //       onTap: () {
                //         setState(() {
                //           onboardingController.directoryselected.value = false;
                //         });
                //       },
                //     ),
                //     SizedBox(
                //       width: w * .026,
                //     ),
                //     Expanded(
                //       child: textStyle(
                //           'Profile listing in chat with astrologers and call with astrologers',
                //           Palatt.grey,
                //           fontSize: w * .043,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: h * .02,
                // ),
                Row(
                  children: [
                    // SizedBox(width: w * .032),
                    InkWell(
                      child: checkBoxContainer(isSelected),
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                    ),
                    SizedBox(
                      width: w * .026,
                    ),
                    textStyle('I agree to the ', Palatt.grey,
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
                        onTap: () => Get.toNamed(
                              Routes.termsncondition,
                            )),
                  ],
                ),
                SizedBox(
                  height: h * .03,
                ),
                Obx(
                  () => (onboardingController.isLoading.value == true
                          ? false
                          : false)
                      ? loader
                      : InkWell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * .042),
                            child: gradientContainer(
                              h * .065,
                              double.infinity,
                              10,
                              textStyle('Continue', Palatt.white,
                                  fontSize: w * .043,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () {
                            // if (onboardingController
                            //     .mobileController.text.isEmpty) {
                            //   Get.rawSnackbar(
                            //       messageText: textStyle(
                            //           "Please enter your phone number",
                            //           Palatt.white,
                            //           fontSize: w * .04,
                            //           fontWeight: FontWeight.w500),
                            //       backgroundColor: Colors.red);

                            //   return;
                            // }

                            // if (onboardingController
                            //         .mobileController.text.length !=
                            //     10) {
                            //   Get.rawSnackbar(
                            //       messageText: textStyle(
                            //           "Please enter valid phone number",
                            //           Palatt.white,
                            //           fontSize: w * .04,
                            //           fontWeight: FontWeight.w500),
                            //       backgroundColor: Colors.red);

                            //   return;
                            // }
                            // if (onboardingController
                            //     .nameController.text.isEmpty) {
                            //   Get.rawSnackbar(
                            //       messageText: textStyle(
                            //           "Please enter name", Palatt.white,
                            //           fontSize: w * .04,
                            //           fontWeight: FontWeight.w500),
                            //       backgroundColor: Colors.red);

                            //   return;
                            // }
                            // if (!isSelected) {
                            //   Get.rawSnackbar(
                            //       messageText: textStyle(
                            //           "Please accept Terms and Conditions to continue",
                            //           Palatt.white,
                            //           fontSize: w * .04,
                            //           fontWeight: FontWeight.w500),
                            //       backgroundColor: Colors.red);

                            //   return;
                            // }

                            onboardingController.onsignup(context);
                          },
                        ),
                ),
                // SizedBox(
                //   height: h * .024,
                // ),
                // textStyle('OR', Palatt.primary, w * .039, FontWeight.w500),
                // SizedBox(
                //   height: h * .024,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     loginGFA(Palatt.white, AppImages.iconGoogle),
                //     SizedBox(
                //       width: w * .08,
                //     ),
                //     loginGFA(AppColor.colFbCircle, AppImages.iconFB),
                //   ],
                // ),
                Padding(
                  padding: EdgeInsets.only(top: h * .034, bottom: h * .026),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textStyle('Already have an account? ', Palatt.black,
                          fontSize: 15, fontWeight: FontWeight.w500),
                      InkWell(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: w * .038,
                                color: Palatt.primary,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            Get.back();
                            Get.to(() => LoginAstro(
                                  phone: '',
                                ));
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container checkBoxContainer(bool varVisible) {
    return Container(
      margin: EdgeInsets.only(left: w * .042),
      height: w * .055,
      width: w * .055,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2.5)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Palatt.primary,
            // AppColor.colYellow,
            Palatt.primary,
          ],
        ),
      ),
      child: Center(
        child: Visibility(
            visible: varVisible,
            child: FittedBox(
              child: Icon(
                Icons.check_rounded,
                color: Palatt.white,
              ),
            )),
      ),
    );
  }

  Container signupTextForm(String hintText, TextInputType textInputType,
      TextEditingController textController,
      {bool? nonEditable,
      int? maxLength,
      double? height,
      int? maxLines = 1,
      bool? isDense,
      List<TextInputFormatter>? inputFormatters}) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(
          left: w * .042, right: w * .042, top: h * .01, bottom: h * .01),
      decoration: const BoxDecoration(
        color: Palatt.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: [
          BoxShadow(color: Color(0xffebebeb), blurRadius: 5, spreadRadius: 3),
        ],
      ),
      child: TextFormField(
        enabled: nonEditable,
        // controller: textController,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        maxLength: maxLength,
        onChanged: (value) {
          mobNumber = value;
        },
        style: TextStyle(fontSize: w * .043, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          isDense: isDense,
          isCollapsed: true,
          hintText: hintText,
          contentPadding:
              EdgeInsets.symmetric(horizontal: w * .042, vertical: 10),
          hintStyle: TextStyle(
              fontSize: w * .04,
              color: const Color(0xffa4a4a4),
              fontWeight: FontWeight.w500),
          fillColor: Colors.transparent,
          filled: true,
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: w * 0, color: Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(13.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: w * 0, color: Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(13.0)),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
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
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  color: Palatt.boxShadow, blurRadius: 5, offset: Offset(1, 0)),
            ]),
        child: SvgPicture.asset(
          iconPath,
        ),
      ),
    );
  }
}
