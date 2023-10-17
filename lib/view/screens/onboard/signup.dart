// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controllers.dart';
import '../../../util/colors.dart';
import '../../../util/extra_widget.dart';
import '../../../util/images.dart';
import '../../../util/methods.dart';
import '../../../util/textstyles.dart';
import 'login_astro.dart';

String mobNumber = '';
String filePath = 'Add File Upload';

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
    filePath = 'Add File Upload';

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

    return Scaffold(
      backgroundColor: AppColor.colWhite,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: AppColor.colWhite,
        toolbarHeight: h * .08,
        leading: ModalRoute.of(context)?.canPop == true
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: w * .075,
                  color: AppColor.colBlack,
                ),
                onPressed: () {
                  onboardingController.email = '';
                  Get.back();
                },
              )
            : null,
        centerTitle: true,
        title:
            textStyle('Sign Up', AppColor.colText1, w * .059, FontWeight.bold),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backgroundImage),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth),
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                SizedBox(
                  height: h * .025,
                ),

                signupTextForm('Full Name', TextInputType.name,
                    onboardingController.nameController,
                    nonEditable: true,
                    maxLength: null,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ]),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      onTapped = !onTapped;
                    });
                  },
                  child: Container(
                      height: h * .063,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: w * .042),
                      margin: EdgeInsets.only(
                          left: w * .042,
                          right: w * .042,
                          top: h * .01,
                          bottom: h * .01),
                      decoration: BoxDecoration(
                          color: AppColor.colWhite,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(13)),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffebebeb),
                                blurRadius: 5,
                                spreadRadius: 3),
                          ]),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: textStyle(
                            onboardingController.gender,
                            onboardingController.gender == 'Gender'
                                ? const Color(0xffa4a4a4)
                                : AppColor.colBlack,
                            w * .04,
                            onboardingController.gender == 'Gender'
                                ? FontWeight.w500
                                : FontWeight.bold),
                      )),
                ),
                Visibility(
                  visible: onTapped,
                  child: Container(
                      // height: h * .063,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: w * .042,
                          right: w * .042,
                          top: h * .01,
                          bottom: h * .0),
                      margin: EdgeInsets.only(
                          left: w * .042,
                          right: w * .042,
                          top: h * .01,
                          bottom: h * .01),
                      decoration: BoxDecoration(
                          color: AppColor.colWhite,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(13)),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffebebeb),
                                blurRadius: 5,
                                spreadRadius: 3),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                              onboardingController.gender = 'Male';
                              onTapped = !onTapped;
                            },
                            child: SizedBox(
                              height: h * .05,
                              width: double.infinity,
                              child: textStyle('Male', AppColor.colBlack,
                                  w * .04, FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                              onboardingController.gender = 'Female';
                              onTapped = !onTapped;
                            },
                            child: SizedBox(
                              height: h * .04,
                              width: double.infinity,
                              child: textStyle('Female', AppColor.colBlack,
                                  w * .04, FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                ),
                signupTextForm('Mobile No. *', TextInputType.phone,
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
                signupTextForm('City', TextInputType.text,
                    onboardingController.cityController),
                signupTextForm('Country', TextInputType.text,
                    onboardingController.countryController),
                signupTextForm('System Known', TextInputType.text,
                    onboardingController.systemController),
                // Select Language
                GestureDetector(
                  onTap: () {
                    setState(() {
                      onTappedLang = !onTappedLang;
                    });
                  },
                  child: signupTextForm('Language', TextInputType.text,
                      onboardingController.languageController,
                      nonEditable: false),
                ),
                Visibility(
                  visible: onTappedLang,
                  child: Container(
                    // height: h * .063,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        left: w * .042,
                        right: w * .042,
                        top: h * .01,
                        bottom: h * .0),
                    margin: EdgeInsets.only(
                        left: w * .042,
                        right: w * .042,
                        top: h * .01,
                        bottom: h * .01),
                    decoration: BoxDecoration(
                        color: AppColor.colWhite,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(13)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffebebeb),
                              blurRadius: 5,
                              spreadRadius: 3),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        onboardingController.languageList.length,
                        (index) => GestureDetector(
                          onTap: () {
                            print('start');
                            print(onboardingController.languageList);
                            setState(() {
                              onboardingController
                                      .languageList[index].isSelected =
                                  !onboardingController
                                      .languageList[index].isSelected;
                              onboardingController.languageController.text =
                                  onboardingController.languageList
                                      .where((p0) => p0.isSelected)
                                      .map((e) => e.language)
                                      .toList()
                                      .join(', ');
                              // onboardingController.language
                              //     .where((element) => element["isSelected"])
                              //     .map((e) => e["language"])
                              //     .toList()
                              //     .join(", ")
                              // ;
                            });
                            print(onboardingController.languageList
                                .where((p0) => p0.isSelected)
                                .map((e) => e.language)
                                .toList()
                                .join(', '));
                          },
                          child: SizedBox(
                            height: h * .05,
                            width: double.infinity,
                            child: Row(
                              children: [
                                checkBoxContainer(onboardingController
                                    .languageList[index].isSelected),
                                SizedBox(width: w * .04),
                                textStyle(
                                    onboardingController
                                        .languageList[index].language
                                        .toString(),
                                    AppColor.colBlack,
                                    w * .04,
                                    FontWeight.bold),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                signupTextForm(
                  'Short Bio',
                  TextInputType.multiline,
                  onboardingController.bioController,
                  isDense: true,
                  maxLines: 2,
                ),
                InkWell(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          bottom: h * .02,
                          top: h * .01,
                          left: w * .042,
                          right: w * .042),
                      margin: EdgeInsets.only(
                          left: w * .042,
                          right: w * .042,
                          top: h * .005,
                          bottom: h * .01),
                      decoration: BoxDecoration(
                          color: AppColor.colWhite,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(13)),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffebebeb),
                                blurRadius: 5,
                                spreadRadius: 3),
                          ]),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/upload.svg',
                            // color: AppColor.colSrchIcon,
                            colorFilter: ColorFilter.mode(
                                AppColor.colSrchIcon, BlendMode.srcIn),
                            width: w * .17,
                          ),
                          textStyle(filePath, AppColor.colSrchIcon, w * .04,
                              FontWeight.w500)
                        ],
                      ),
                    ),
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result == null) {
                        setState(() {
                          filePath = 'Add File Upload';
                        });

                        // print("No file selected");
                      } else {
                        PlatformFile file = result.files.first;

                        // print(file.name);
                        // print(file.bytes);
                        // print(file.size);
                        // print(file.extension);
                        setState(() {
                          filePath = file.path!;
                        });

                        print(file.path);
                        // print(result.files.single.name);
                      }
                    }),
                SizedBox(
                  height: h * .02,
                ),
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
                    textStyle('I agree to the ', AppColor.colLabel, w * .043,
                        FontWeight.w500),
                    InkWell(
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(
                              fontSize: w * .043,
                              color: AppColor.colPrimary,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () => Get.toNamed('/termsAndCondition')),
                  ],
                ),
                SizedBox(
                  height: h * .03,
                ),
                isLoading
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
                        onTap: () {
                          if (onboardingController
                              .mobileController.text.isEmpty) {
                            Get.rawSnackbar(
                                messageText: textStyle(
                                    "Please enter your phone number",
                                    AppColor.colWhite,
                                    w * .04,
                                    FontWeight.w500),
                                backgroundColor: Colors.red);

                            return;
                          }

                          if (onboardingController
                                  .mobileController.text.length !=
                              10) {
                            Get.rawSnackbar(
                                messageText: textStyle(
                                    "Please enter valid phone number",
                                    AppColor.colWhite,
                                    w * .04,
                                    FontWeight.w500),
                                backgroundColor: Colors.red);

                            return;
                          }

                          if (!isSelected) {
                            Get.rawSnackbar(
                                messageText: textStyle(
                                    "Please accept Terms and Conditions to continue",
                                    AppColor.colWhite,
                                    w * .04,
                                    FontWeight.w500),
                                backgroundColor: Colors.red);

                            return;
                          }

                          // onboardingController.signupForm();
                        },
                      ),

                SizedBox(
                  height: h * .024,
                ),
                textStyle('OR', AppColor.colPrimary, w * .039, FontWeight.w500),
                SizedBox(
                  height: h * .024,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginGFA(AppColor.colWhite, AppImages.iconGoogle),
                    SizedBox(
                      width: w * .08,
                    ),
                    loginGFA(AppColor.colFbCircle, AppImages.iconFB),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * .034, bottom: h * .026),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textStyle('Already have an account? ', AppColor.colBlack,
                          w * .038, FontWeight.bold),
                      InkWell(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: w * .038,
                                color: AppColor.colPrimary,
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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2.5)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff785FFB),
            Color(0xffB144F2),
          ],
        ),
      ),
      child: Center(
        child: Visibility(
            visible: varVisible,
            child: FittedBox(
              child: Icon(
                Icons.check_rounded,
                color: AppColor.colWhite,
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
      height: h * .063,
      margin: EdgeInsets.only(
          left: w * .042, right: w * .042, top: h * .01, bottom: h * .01),
      decoration: BoxDecoration(
        color: AppColor.colWhite,
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        boxShadow: const [
          BoxShadow(color: Color(0xffebebeb), blurRadius: 5, spreadRadius: 3),
        ],
      ),
      child: TextFormField(
        enabled: nonEditable,
        controller: textController,
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
          hintText: hintText,
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
