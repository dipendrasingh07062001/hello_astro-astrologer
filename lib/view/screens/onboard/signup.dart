// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:astro/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../controller/onboarding/onboarding_controllers.dart';
import '../../../data/model/availbilityTimeModel/model.dart';
import '../../../data/model/expertise_model.dart';
import '../../../theme/colorpalatt.dart';
import '../../../theme/themedata.dart';
import '../../../util/buttons.dart';
import '../../../util/datepicker.dart';
import '../../../util/extra_widget.dart';
import '../../../util/images.dart';
import '../../../util/methods.dart';
import '../../../util/textstyles.dart';
import '../../widgets/space.dart';
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
    onboardingController.gender.value = 'Gender';
    // onboardingController.email = "";
    onboardingController.filePath.value = '';
    // onboardingController.getexpertisedata();

    // onboardingController.getLanguage();
    onboardingController.getExpertise();
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

                Obx(
                  () => GestureDetector(
                    onTap: onboardingController.ontapgender,
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
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: textStyle(
                              onboardingController.gender.value,
                              onboardingController.gender == 'Gender'
                                  ? const Color(0xffa4a4a4)
                                  : Palatt.black,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: onboardingController.gendershow.value,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  onboardingController.changegender('Male'),
                              child: SizedBox(
                                height: h * .05,
                                width: double.infinity,
                                child: textStyle('Male', Palatt.black,
                                    fontSize: w * .04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  onboardingController.changegender('Female'),
                              child: SizedBox(
                                height: h * .04,
                                width: double.infinity,
                                child: textStyle('Female', Palatt.black,
                                    fontSize: w * .04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
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
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textStyle(
                                "My Expertise",
                                // onboardingController.selectedexpertise.isEmpty
                                //     ? "My Expertise"
                                //     : onboardingController.selectedexpertise
                                //         .map((element) => element.name)
                                //         .join(", "),
                                // onboardingController.selectedexpertise.isEmpty
                                //     ? const Color(0xffa4a4a4)
                                //     : Palatt.black,
                                const Color(0xffa4a4a4),
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
                      )),
                ),
                Obx(
                  () => Visibility(
                      visible: onboardingController.showexpertise.value,
                      child: Column(
                        children: List.generate(
                            onboardingController.expertise.length, (index) {
                          ExpertiseModel model =
                              onboardingController.expertise[index];
                          return GestureDetector(
                            onTap: () =>
                                onboardingController.onexpertisetap(model),
                            child: SizedBox(
                                height: h * .05,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    checkBoxContainer(onboardingController
                                        .selectedexpertise
                                        .any((element) =>
                                            element.id == model.id)),
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
                  onTap: onboardingController.ontapLanguage,
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textStyle("Language", const Color(0xffa4a4a4),
                              fontSize: w * .04, fontWeight: FontWeight.w400),
                          const Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Palatt.grey,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                      visible: onboardingController.languageshow.value,
                      child: Column(
                        children: List.generate(
                            onboardingController.language.length, (index) {
                          var data = onboardingController.language[index];
                          return GestureDetector(
                            onTap: () =>
                                onboardingController.selectlanguage(index),
                            child: SizedBox(
                                height: h * .05,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    checkBoxContainer(data["isSelected"].value),
                                    SizedBox(width: w * .04),
                                    textStyle(
                                        data["language"] ?? "", Palatt.black,
                                        fontSize: w * .04,
                                        fontWeight: FontWeight.bold),
                                    const Spacer(),
                                  ],
                                )),
                          );
                        }),
                      )),
                ),

                GestureDetector(
                  onTap: onboardingController.ontapavailablity,
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textStyle("Availability Day/Timing",
                              const Color(0xffa4a4a4),
                              fontSize: w * .04, fontWeight: FontWeight.w400),
                          const Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.access_time_rounded,
                                color: Palatt.grey,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: onboardingController.availabilityTimeshow.value,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: w * .042,
                          right: w * .042,
                          top: h * .01,
                          bottom: h * .01),
                      decoration: BoxDecoration(
                          color: Palatt.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Palatt.boxShadow,
                              blurRadius: 6,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: !onboardingController.allday.value,
                            child: Container(
                              height: 53,
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                color: Palatt.blueshadelight,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: onboardingController
                                    .availabilityDateList.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () =>
                                        onboardingController.ontapDate(index),
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 14),
                                      width: 34,
                                      height: 45,
                                      decoration: const BoxDecoration(
                                        // color: Palatt.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              DateFormat("EEE")
                                                  .format(onboardingController
                                                      .availabilityDateList[
                                                          index]
                                                      .date!)
                                                  .toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: googleFontstyle(
                                                const TextStyle(
                                                    fontSize: 10,
                                                    color: Palatt.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                          CircleAvatar(
                                            radius: 14,
                                            backgroundColor:
                                                onboardingController
                                                            .selectedindex
                                                            .value ==
                                                        index
                                                    ? Palatt.primary
                                                    : Palatt.transparent,
                                            child: Text(
                                                DateFormat("dd").format(
                                                    onboardingController
                                                        .availabilityDateList[
                                                            index]
                                                        .date!),
                                                textAlign: TextAlign.center,
                                                style: googleFontstyle(
                                                  TextStyle(
                                                      fontSize: 15,
                                                      color: onboardingController
                                                                  .selectedindex
                                                                  .value ==
                                                              index
                                                          ? Palatt.white
                                                          : Palatt.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          // const Divider(color: Palatt.grey, thickness: 1),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 13),
                                child: Text("Walking",
                                    style: googleFontstyle(
                                      const TextStyle(
                                        fontSize: 19,
                                        color: Palatt.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ),
                              const Spacer(),
                              Text("All days",
                                  style: googleFontstyle(
                                    const TextStyle(
                                      fontSize: 12,
                                      color: Palatt.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                              GestureDetector(
                                  onTap: () =>
                                      onboardingController.allday.value =
                                          !onboardingController.allday.value,
                                  child: checkBoxContainer(
                                      onboardingController.allday.value)),
                              spaceHorizontal(16)
                            ],
                          ),
                          onboardingController.allday.value
                              ? ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: onboardingController
                                      .alldaytimeList.length,
                                  itemBuilder: (context, index) {
                                    Timing timing = onboardingController
                                        .alldaytimeList[index];
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                visible: index == 0,
                                                child: Text("Start time",
                                                    style: googleFontstyle(
                                                      const TextStyle(
                                                        fontSize: 15,
                                                        color: Palatt.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )),
                                              ),
                                              timingSlot(
                                                  DateFormat().add_jm().format(
                                                      timing.startTime!),
                                                  foregroundColor:
                                                      Palatt.greyshade2,
                                                  borderColor:
                                                      Palatt.greyshade2,
                                                  radius: 8, onTap: () async {
                                                picktime().then((value) {
                                                  if (value != null) {
                                                    timing.startTime =
                                                        getDateWithGivenTime(
                                                            value);
                                                    onboardingController
                                                        .availabilityDateList[
                                                            onboardingController
                                                                .selectedindex
                                                                .value]
                                                        .saved!
                                                        .value = false;

                                                    setState(() {});
                                                  }
                                                });
                                              }
                                                  //     onTap: () {
                                                  //   setState(() {
                                                  //     astroPrfileController.whichtime =
                                                  //         astroPrfileController
                                                  //             .selectedavailability
                                                  //             .timing[index];
                                                  //   });
                                                  // },
                                                  ),
                                              spaceVertical(10)
                                            ],
                                          ),
                                        ),
                                        spaceHorizontal(14),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                visible: index == 0,
                                                child: Text("End time",
                                                    style: googleFontstyle(
                                                      const TextStyle(
                                                        fontSize: 15,
                                                        color: Palatt.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )),
                                              ),
                                              timingSlot(
                                                  DateFormat()
                                                      .add_jm()
                                                      .format(timing.endTime!),
                                                  radius: 8,
                                                  borderColor:
                                                      Palatt.greyshade2,
                                                  foregroundColor:
                                                      Palatt.greyshade2,
                                                  onTap: () async {
                                                picktime().then((value) {
                                                  if (value != null) {
                                                    timing.endTime =
                                                        getDateWithGivenTime(
                                                            value);
                                                    onboardingController
                                                        .availabilityDateList[
                                                            onboardingController
                                                                .selectedindex
                                                                .value]
                                                        .saved!
                                                        .value = false;
                                                    setState(() {});
                                                  }
                                                });
                                              }
                                                  //     onTap: () {
                                                  //   setState(() {
                                                  //     astroPrfileController.whichtime =
                                                  //         astroPrfileController
                                                  //             .selectedavailability
                                                  //             .timing[index];
                                                  //   });
                                                  // },
                                                  ),
                                              spaceVertical(10)
                                            ],
                                          ),
                                        ),
                                        spaceHorizontal(18),
                                        Expanded(
                                          flex: 2,
                                          child: RRButton2(
                                            onTap: () => onboardingController
                                                .ontapAddRemoveIcon(index),
                                            height: 34,
                                            radius: 8,
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            backgroundColor: Palatt.primary,
                                            child: Icon(
                                              index == 0
                                                  ? Icons.add
                                                  : Icons.remove,
                                              color: Palatt.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                )
                              : ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: onboardingController
                                      .availabilityDateList[onboardingController
                                          .selectedindex.value]
                                      .timing!
                                      .length,
                                  itemBuilder: (context, index) {
                                    Timing timing = onboardingController
                                        .availabilityDateList[
                                            onboardingController
                                                .selectedindex.value]
                                        .timing![index];
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                visible: index == 0,
                                                child: Text("Start time",
                                                    style: googleFontstyle(
                                                      const TextStyle(
                                                        fontSize: 15,
                                                        color: Palatt.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )),
                                              ),
                                              timingSlot(
                                                  DateFormat().add_jm().format(
                                                      timing.startTime!),
                                                  foregroundColor:
                                                      Palatt.greyshade2,
                                                  borderColor:
                                                      Palatt.greyshade2,
                                                  radius: 8, onTap: () async {
                                                picktime().then((value) {
                                                  if (value != null) {
                                                    timing.startTime =
                                                        getDateWithGivenTime(
                                                            value);
                                                    onboardingController
                                                        .availabilityDateList[
                                                            onboardingController
                                                                .selectedindex
                                                                .value]
                                                        .saved!
                                                        .value = false;

                                                    setState(() {});
                                                  }
                                                });
                                              }
                                                  //     onTap: () {
                                                  //   setState(() {
                                                  //     astroPrfileController.whichtime =
                                                  //         astroPrfileController
                                                  //             .selectedavailability
                                                  //             .timing[index];
                                                  //   });
                                                  // },
                                                  ),
                                              spaceVertical(10)
                                            ],
                                          ),
                                        ),
                                        spaceHorizontal(14),
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                visible: index == 0,
                                                child: Text("End time",
                                                    style: googleFontstyle(
                                                      const TextStyle(
                                                        fontSize: 15,
                                                        color: Palatt.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    )),
                                              ),
                                              timingSlot(
                                                  DateFormat()
                                                      .add_jm()
                                                      .format(timing.endTime!),
                                                  radius: 8,
                                                  borderColor:
                                                      Palatt.greyshade2,
                                                  foregroundColor:
                                                      Palatt.greyshade2,
                                                  onTap: () async {
                                                picktime().then((value) {
                                                  if (value != null) {
                                                    timing.endTime =
                                                        getDateWithGivenTime(
                                                            value);
                                                    onboardingController
                                                        .availabilityDateList[
                                                            onboardingController
                                                                .selectedindex
                                                                .value]
                                                        .saved!
                                                        .value = false;
                                                    setState(() {});
                                                  }
                                                });
                                              }
                                                  //     onTap: () {
                                                  //   setState(() {
                                                  //     astroPrfileController.whichtime =
                                                  //         astroPrfileController
                                                  //             .selectedavailability
                                                  //             .timing[index];
                                                  //   });
                                                  // },
                                                  ),
                                              spaceVertical(10)
                                            ],
                                          ),
                                        ),
                                        spaceHorizontal(18),
                                        Expanded(
                                          flex: 2,
                                          child: RRButton2(
                                            onTap: () => onboardingController
                                                .ontapAddRemoveIcon(index),
                                            height: 34,
                                            radius: 8,
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            backgroundColor: Palatt.primary,
                                            child: Icon(
                                              index == 0
                                                  ? Icons.add
                                                  : Icons.remove,
                                              color: Palatt.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                          spaceVertical(10),
                          Visibility(
                              visible: onboardingController.allday.value
                                  ? false
                                  : !onboardingController
                                      .availabilityDateList[onboardingController
                                          .selectedindex.value]
                                      .saved!
                                      .value,
                              child: continuebutton(text: "Add", () {
                                onboardingController
                                    .availabilityDateList[onboardingController
                                        .selectedindex.value]
                                    .saved!
                                    .value = true;
                              })),
                          spaceVertical(10),
                        ],
                      ),
                    ),
                  ),
                ),
                signupTextForm(
                  'PAN Number',
                  TextInputType.text,
                  onboardingController.panController,
                ),
                signupTextForm(
                  'GST Number',
                  TextInputType.text,
                  onboardingController.gstController,
                ),
                signupTextForm(
                  'Consultancy Charges Per Minute',
                  TextInputType.text,
                  onboardingController.consultpriceController,
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textStyle("Upload PAN Card", const Color(0xffa4a4a4),
                              fontSize: w * .04, fontWeight: FontWeight.w400),
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
                  ),
                ),

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
                Visibility(
                    child: Row(
                  children: [
                    spaceHorizontal(w * 0.04),
                    textStyle("Enter bio for", const Color(0xffa4a4a4),
                        fontSize: 16, fontWeight: FontWeight.w400),
                    spaceHorizontal(5),
                    PopupMenuButton(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Palatt.primary,
                            )),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: textStyle(
                            onboardingController.selectedLanguage.value == ""
                                ? "Language"
                                : onboardingController.selectedLanguage.value,
                            Palatt.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      itemBuilder: (context) {
                        return onboardingController.language
                            .where((element) => element["isSelected"].value)
                            .map((e) => PopupMenuItem(
                                  onTap: () {
                                    onboardingController
                                        .selectedLanguage.value = e["language"];
                                    onboardingController.languageController
                                        .text = e["bio"].value;
                                    setState(() {});
                                  },
                                  child: textStyle(
                                      e["language"], const Color(0xffa4a4a4),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ))
                            .toList();
                      },
                    ),
                  ],
                )),
                signupTextForm(
                  'Profile Bio(Multiple language)',
                  TextInputType.multiline,
                  onboardingController.languageController,
                  onChanged: (p0) {
                    if (onboardingController.selectedLanguage.value == "") {
                      return;
                    }
                    var data = onboardingController.language.firstWhereOrNull(
                        (element) =>
                            element["language"] ==
                            onboardingController.selectedLanguage.value);
                    if (data != null) {
                      data["bio"].value = p0;
                    }
                  },
                  maxLines: 2,
                ),
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
                  () => onboardingController.isLoading.value
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

                            onboardingController.onsignup();
                          },
                        ),
                ),

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
      decoration: const BoxDecoration(
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
            child: const FittedBox(
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
      void Function(String)? onChanged,
      List<TextInputFormatter>? inputFormatters}) {
    return Container(
      // height: 50,
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
        controller: textController,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        maxLength: maxLength,
        minLines: 1,
        onChanged: onChanged,
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
