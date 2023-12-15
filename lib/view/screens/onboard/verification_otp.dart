import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../controller/onboarding/onboarding_controllers.dart';
import '../../../theme/colorpalatt.dart';
import '../../../util/buttons.dart';
import '../../../util/extra_widget.dart';
import '../../../util/images.dart';
import '../../../util/textstyles.dart';
import '../../../util/loadingview.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
    final defaultPinTheme = PinTheme(
      width: 75,
      height: 53,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Palatt.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Palatt.boxShadow, width: 1.8),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final focusedPinTheme = PinTheme(
      width: 75,
      height: 53,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Palatt.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Palatt.primary, width: 1.8),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final disabledPinTheme = PinTheme(
      width: 75,
      height: 53,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Palatt.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Palatt.boxShadow, width: 1.8),
        borderRadius: BorderRadius.circular(8),
      ),
    );

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
            backgroundColor: Palatt.white,
            leading: ModalRoute.of(context)?.canPop == true
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: w * .075,
                      color: Palatt.black,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  )
                : null,
            centerTitle: true,
            title: textStyle('Verification', Palatt.black,
                fontSize: w * .059, fontWeight: FontWeight.w500),
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * .045,
                        ),
                        SvgPicture.asset(
                          AppImages.otp,
                          width: w * .63,
                        ),
                        SizedBox(height: h * .048),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textStyle('OTP has been sent on your registered ',
                                Palatt.grey,
                                fontSize: w * .043,
                                fontWeight: FontWeight.w500),
                            Row(
                              children: [
                                textStyle('Phone Number ', Palatt.grey,
                                    fontSize: w * .043,
                                    fontWeight: FontWeight.w500),
                                textStyle('xxxxxxxx', Palatt.primary,
                                    fontSize: w * .043,
                                    fontWeight: FontWeight.w500),
                                textStyle(
                                    "90", // onboardingController.mobileController.text
                                    //     .substring(8, 10),
                                    Palatt.primary,
                                    fontSize: w * .043,
                                    fontWeight: FontWeight.w500),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: h * .02),
                        Pinput(
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          disabledPinTheme: disabledPinTheme,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: h * .024,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textStyle('Didn\'t Receive Code? ', Palatt.black,
                                fontSize: w * .039,
                                fontWeight: FontWeight.w600),
                            InkWell(
                              child: Text(
                                'Resend Now',
                                style: TextStyle(
                                  fontSize: w * .039,
                                  color: Palatt.primary,
                                  fontWeight: FontWeight.w600,
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
                                    // if (first.text.isNotEmpty &&
                                    //     second.text.isNotEmpty &&
                                    //     third.text.isNotEmpty &&
                                    //     fourth.text.isNotEmpty) {
                                    onboardingController.verifyotp("");
                                    // } else {
                                    //   Get.rawSnackbar(
                                    //       messageText: textStyle(
                                    //           'Please enter valid OTP',
                                    //           Palatt.white,
                                    //           fontSize: w * .04,
                                    //           fontWeight: FontWeight.w500),
                                    //       backgroundColor: Colors.red);
                                    // }
                                  },
                                  color: Palatt.primary,
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
          )),
    );
  }
}
