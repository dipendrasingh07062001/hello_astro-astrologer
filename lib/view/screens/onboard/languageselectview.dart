import 'package:astro/view/screens/onboard/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/onboarding/languagecontroller.dart';
import '../../../theme/colorpalatt.dart';
import '../../../util/buttons.dart';
import '../../../util/extra_widget.dart';
import '../../../util/images.dart';
import '../../../util/textstyles.dart';
import '../../widgets/backgroundimages.dart';

class LanguageSelectView extends GetView<LanguageController> {
  LanguageSelectView({super.key});
  final double h = Get.height, w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palatt.white,
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
                  Navigator.of(context).pop();
                },
              )
            : null,
        centerTitle: true,
        title: textStyle('Select Language', Palatt.black,
            fontSize: w * .059, fontWeight: FontWeight.w500),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: w * .04),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.background),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth),
          ),
          child: Stack(
            children: [
              const Background2(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: h * .045,
                    ),
                    SvgPicture.asset(
                      AppImages.languageview,
                      width: w * .63,
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (_, index) {
                          return Obx(() => LanguageTile(
                                "English",
                                "English",
                                "English",
                                "India",
                                isTypeSelected:
                                    controller.selectedlanguage.value,
                                onTap: () => controller.selectlang("English"),
                              ));
                        }),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       top: h * .04, right: w * .09, bottom: h * .024),
                    //   child: Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: textStyle(
                    //         'Have a Referral code?', Palatt.blacklightshade,
                    //         fontSize: 17, fontWeight: FontWeight.w500),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? loader
                          : EltdButton(
                              title: 'Continue',
                              width: w * .92,
                              height: h * .065,
                              press: () {},
                              color: Palatt.primary,
                              radius: 10.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
