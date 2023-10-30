import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding_controllers.dart';
import '../../../util/buttons.dart';
import '../../../util/colors.dart';
import '../../../util/extra_widget.dart';
import '../../../util/images.dart';
import '../../../util/textstyles.dart';
import '../../utils/loadingview.dart';
import 'login_astro.dart';

// class Verification1 extends StatelessWidget {
//   String phone;

//   Verification1({
//     Key? key,
//     required this.phone,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class Verification extends StatefulWidget {
  const Verification({
    Key? key,
  }) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool isLoading = false;

  OnboardingController onboardingController = Get.put(OnboardingController());

  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();

  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  var tap = 0;
  var tap1 = 0;
  var tap2 = 0;
  var tap3 = 0;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  void previousField(String value, FocusNode focusNode) {
    if (value.isEmpty) {
      focusNode.requestFocus();
    }
  }

  late double h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.colWhite,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.colWhite,
          leading: ModalRoute.of(context)?.canPop == true
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: w * .075,
                    color: AppColor.colBlack,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                )
              : null,
          centerTitle: true,
          title: textStyle(
              'Verification', AppColor.colText1, w * .059, FontWeight.w500),
        ),
        body: Obx(
          () => PageLoadingView(
            isloading: onboardingController.resendingotp.value,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: w * .04),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.backgroundImage),
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.fitWidth),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * .045,
                      ),
                      SvgPicture.asset(
                        AppImages.verifImage,
                        width: w * .63,
                      ),
                      SizedBox(height: h * .048),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textStyle('OTP has been sent on your registered ',
                              AppColor.colLabel, w * .043, FontWeight.w500),
                          Row(
                            children: [
                              textStyle('Phone Number ', AppColor.colLabel,
                                  w * .043, FontWeight.w500),
                              textStyle('xxxxxxxx', AppColor.colPrimary,
                                  w * .043, FontWeight.w500),
                              textStyle(
                                  onboardingController.mobileController.text
                                      .substring(8, 10),
                                  AppColor.colPrimary,
                                  w * .043,
                                  FontWeight.w500),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: h * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: w * .213,
                            height: h * .07,
                            child: TextFormField(
                              onChanged: (value) {
                                nextField(value, pin2FocusNode);
                                //previousField(value, pin2FocusNode);
                              },
                              focusNode: pin1FocusNode,
                              showCursor: true,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: w * .054,
                                  fontWeight: FontWeight.w900),
                              keyboardType: TextInputType.number,
                              controller: first,
                              maxLength: 1,
                              cursorColor: AppColor.colPrimary,
                              // cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                counterText: "",
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * .0044,
                                      color: AppColor.colPrimary),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * .0044,
                                      color: first.text.isNotEmpty
                                          ? AppColor.colPrimary
                                          : AppColor.colOtpBorder),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: w * .02),
                          SizedBox(
                            width: w * .213,
                            height: h * .07,
                            child: TextFormField(
                              focusNode: pin2FocusNode,
                              onChanged: (value) {
                                if (value.toString().isEmpty && tap2 == 0) {
                                  debugPrint("Print1");

                                  tap2 = 1;
                                }
                                if (value.toString().isNotEmpty) {
                                  debugPrint("Print2");
                                  FocusScope.of(context)
                                      .requestFocus(pin3FocusNode);
                                }
                                if (value.toString().isEmpty && tap2 == 1) {
                                  debugPrint("Print3");
                                  FocusScope.of(context)
                                      .requestFocus(pin1FocusNode);
                                }
                              },
                              showCursor: true,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: w * .054,
                                  fontWeight: FontWeight.w900),
                              keyboardType: TextInputType.number,
                              controller: second,
                              maxLength: 1,
                              cursorColor: AppColor.colPrimary,
                              // cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                counterText: "",
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * .0044,
                                      color: AppColor.colPrimary),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * .0044,
                                      color: second.text.isNotEmpty
                                          ? AppColor.colPrimary
                                          : AppColor.colOtpBorder),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: w * .02),
                          SizedBox(
                            width: w * .213,
                            height: h * .07,
                            child: TextFormField(
                              focusNode: pin3FocusNode,
                              onChanged: (value) {
                                if (value.toString().isEmpty && tap3 == 0) {
                                  tap3 = 1;
                                }
                                if (value.toString().isNotEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(pin4FocusNode);
                                }
                                if (value.toString().isEmpty && tap3 == 1) {
                                  FocusScope.of(context)
                                      .requestFocus(pin2FocusNode);
                                }
                              },
                              showCursor: true,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: w * .054,
                                  fontWeight: FontWeight.w900),
                              keyboardType: TextInputType.number,
                              controller: third,
                              maxLength: 1,
                              cursorColor: AppColor.colPrimary,
                              // cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                counterText: "",
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * .0044,
                                      color: AppColor.colPrimary),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * .0044,
                                      color: third.text.isNotEmpty
                                          ? AppColor.colPrimary
                                          : AppColor.colOtpBorder),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: w * .02),
                          SizedBox(
                            width: w * .213,
                            height: h * .07,
                            child: TextFormField(
                              focusNode: pin4FocusNode,
                              onChanged: (value) {
                                if (value.toString().isEmpty && tap3 == 0) {
                                  tap3 = 1;
                                }
                                if (value.toString().isNotEmpty) {
                                  FocusScope.of(context).unfocus();
                                }
                                if (value.toString().isEmpty && tap3 == 1) {
                                  FocusScope.of(context)
                                      .requestFocus(pin3FocusNode);
                                }
                              },
                              showCursor: true,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: w * .054,
                                  fontWeight: FontWeight.w900),
                              keyboardType: TextInputType.number,
                              controller: fourth,
                              maxLength: 1,
                              cursorColor: AppColor.colPrimary,
                              // cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                counterText: "",
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * .0044,
                                      color: AppColor.colPrimary),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: w * .0044,
                                      color: fourth.text.isNotEmpty
                                          ? AppColor.colPrimary
                                          : AppColor.colOtpBorder),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * .024,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textStyle('Didn\'t Receive Code? ', AppColor.colText3,
                              w * .039, FontWeight.w900),
                          InkWell(
                            child: Text(
                              'Resend Now',
                              style: TextStyle(
                                fontSize: w * .039,
                                color: AppColor.colPrimary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onTap: () {
                              onboardingController.resend();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * .050,
                      ),
                      Obx(
                        () => onboardingController.isLoading.value
                            ? loader
                            : EltdButton(
                                title: 'Continue',
                                width: w * .92,
                                height: h * .065,
                                press: () {
                                  String sub =
                                      "${first.text}${second.text}${third.text}${fourth.text}";
                                  if (first.text.isNotEmpty &&
                                      second.text.isNotEmpty &&
                                      third.text.isNotEmpty &&
                                      fourth.text.isNotEmpty) {
                                    onboardingController.verifyotp(sub);
                                  } else {
                                    Get.rawSnackbar(
                                        messageText: textStyle(
                                            'Please enter valid OTP',
                                            AppColor.colWhite,
                                            w * .04,
                                            FontWeight.w500),
                                        backgroundColor: Colors.red);
                                  }
                                },
                                color: AppColor.colPrimary,
                                radius: 15.0,
                                fntSize: w * .04,
                                fntwgt: FontWeight.w500,
                              ),
                      ),
                      SizedBox(
                        height: h * .193,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
