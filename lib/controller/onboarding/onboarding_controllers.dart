import 'dart:io';

import 'package:astro/data/model/expertise_model.dart';
import 'package:astro/util/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../api/apiconstants.dart';
import '../../api/apiservices.dart';
import '../../data/model/availbilityTimeModel/model.dart';
import '../../helper/route_helper.dart';
import '../../theme/colorpalatt.dart';
import '../../util/textstyles.dart';
import 'package:http/http.dart' as http;

class OnboardingController extends GetxController {
  RxBool isLoading = false.obs;
  RxString profileImage = "".obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController systemController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController qualificationsController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController consultpriceController = TextEditingController();
  RxBool allday = false.obs;
  RxBool isSelected = false.obs;
  RxBool showexpertise = false.obs;
  RxBool directoryselected = true.obs;
  RxBool gendershow = false.obs;
  RxBool languageshow = false.obs;
  RxBool availabilityTimeshow = false.obs;
  RxList<ExpertiseModel> selectedexpertise = RxList();
  RxList<Timing> alldaytimeList =
      RxList([Timing(startTime: DateTime.now(), endTime: DateTime.now())]);
  RxList<AvailabilityTiming> availabilityDateList = RxList([
    AvailabilityTiming(
        saved: false.obs,
        timing:
            [Timing(startTime: DateTime.now(), endTime: DateTime.now())].obs)
  ]);
  RxInt selectedindex = 0.obs;

  List language = [
    {"language": "Hindi", "isSelected": false.obs, "bio": "".obs},
    {"language": "English", "isSelected": false.obs, "bio": "".obs}
  ];
  RxString selectedLanguage = "".obs;
  RxString gender = 'Gender'.obs;
  // google login api
  String? name;
  String? email;
  String? profilePic;
  RxString filePath = ''.obs;
  RxList<ExpertiseModel> expertise = RxList();
  ontapLanguage() => languageshow.value = !languageshow.value;
  ontapAddRemoveIcon(
    int index,
  ) {
    if (allday.value) {
      if (index == 0) {
        alldaytimeList
            .add(Timing(startTime: DateTime.now(), endTime: DateTime.now()));
      } else {
        alldaytimeList.removeAt(index);
      }
    } else {
      availabilityDateList[selectedindex.value].saved!.value = false;
      if (index == 0) {
        availabilityDateList[selectedindex.value]
            .timing!
            .add(Timing(startTime: DateTime.now(), endTime: DateTime.now()));
      } else {
        availabilityDateList[selectedindex.value].timing!.removeAt(index);
      }
    }
  }

  ontapavailablity() {
    availabilityTimeshow.value = !availabilityTimeshow.value;
    if (availabilityDateList.length == 1) {
      availabilityDateList.value = List.generate(
          10,
          (index) => AvailabilityTiming(
              saved: false.obs,
              date: DateTime.now().add(Duration(days: index)),
              timing: [
                Timing(startTime: DateTime.now(), endTime: DateTime.now())
              ].obs));
    }
  }

  ontapDate(int index) {
    selectedindex.value = index;
  }

  bool checkdateisEqual(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  selectlanguage(int index) => language[index]["isSelected"].value =
      !language[index]["isSelected"].value;
  ontapgender() => gendershow.value = !gendershow.value;
  changegender(String gender) {
    this.gender.value = gender;
    gendershow.value = !gendershow.value;
  }

  getExpertise() async {
    ApiClient apiClient = ApiClient();
    await apiClient.getRequest(ApiUrls.getexpertise).then((value) {
      if (value != null) {
        expertise.value = List<ExpertiseModel>.from(
            value["data"].map((e) => ExpertiseModel.fromJson(e)));
      }
    });
  }

  Widget getprofileImage() {
    if (profileImage.value == "") {
      return CircleAvatar(
        radius: 75,
        backgroundColor: Palatt.grey,
        child: SvgPicture.network(
          "https://myworkdesk.tech/designer/html/hello-astro/assets/images/user-profile.svg",
        ),
      );
    } else {
      return CircleAvatar(
          radius: 75,
          backgroundImage: FileImage(
            File(profileImage.value),
          ));
    }
  }

  pickprofilepick() {
    pickImage().then((value) {
      profileImage.value = value;
    });
  }

  pickcertificat() {
    pickImage().then((value) {
      filePath.value = value;
    });
  }

  showhideexpertise() {
    showexpertise.value = !showexpertise.value;
    print(showexpertise.value);
  }

  onlogin(BuildContext context) {
    if (mobileController.text.isEmpty) {
      Get.rawSnackbar(
          messageText: textStyle("Please enter your phone number", Palatt.white,
              fontSize: Get.width * .04, fontWeight: FontWeight.w500),
          backgroundColor: Colors.red);

      return;
    }

    if (mobileController.text.length != 10) {
      Get.rawSnackbar(
          messageText: textStyle(
              "Please enter valid phone number", Palatt.white,
              fontSize: Get.width * .04, fontWeight: FontWeight.w500),
          backgroundColor: Colors.red);

      return;
    }

    // if (!isSelected.value) {
    //   Get.rawSnackbar(
    //       messageText: textStyle(
    //           "Please accept Terms and Conditions to continue",
    //           Palatt.white,
    //           Get.width * .04,
    //           FontWeight.w500),
    //       backgroundColor: Colors.red);

    //   return;
    // }
    signin();

    // onboardingController
    //     .astroSignup(phoneController.text.trim());
  }

  // signup/login api
  signin() async {
    isLoading.value = true;
    ApiClient apiClient = ApiClient();
    Map<String, String> map = {"phone": mobileController.text};
    await apiClient.postRequest(ApiUrls.signin, map).then((value) {
      if (value != null) {
        print("==$value");
        Get.toNamed(Routes.otpverification);
        isLoading.value = false;
      }
    });
    isLoading.value = false;
  }

  RxBool resendingotp = false.obs;
  resend() async {
    resendingotp.value = true;
    ApiClient apiClient = ApiClient();
    Map<String, String> map = {"phone": mobileController.text};
    await apiClient.postRequest(ApiUrls.resendotp, map).then((value) {
      if (value != null) {
        print("==$value");
        // Get.toNamed(Routes.otpverification);
        resendingotp.value = false;
      }
    });
    resendingotp.value = false;
  }

  onsignup() async {
    isLoading.value = true;
    ApiClient apiClient = ApiClient();
    List<http.MultipartFile> files = [];
    Map<String, String> map = {
      "phone": mobileController.text,
      "name": nameController.text,
      "email": emailController.text,
      "experience": expController.text,
      "expertise[]":
          selectedexpertise.map((element) => element.id).join(", ").toString(),
      "qualifications": qualificationsController.text,
      "bio": bioController.text,
      "astrologer_type": (directoryselected.value ? 1 : 0).toString()
    };
    if (profileImage.value.isNotEmpty) {
      files.add(await http.MultipartFile.fromPath("profile", profileImage.value,
          filename: profileImage.value.split("/").last));
    }
    if (filePath.value.isNotEmpty) {
      files.add(await http.MultipartFile.fromPath("image", filePath.value,
          filename: filePath.value.split("/").last));
    }
    await apiClient
        .postRequest(ApiUrls.signUp, map, files: files)
        .then((value) {
      if (value != null) {
        print("==$value");
        Get.toNamed(Routes.otpverification);
        isLoading.value = false;
      }
    });
    isLoading.value = false;
    // Get.toNamed(Routes.otpverification);
  }

  verifyotp(String otp) async {
    //   isLoading.value = true;
    //   ApiClient apiClient = ApiClient();
    //   Map<String, String> map = {"phone": mobileController.text, "otp": otp};
    //   await apiClient.postRequest(ApiUrls.verifiotp, map).then((value) {
    //     if (value != null) {
    //       print("==$value");
    //       Get.toNamed(Routes.home);
    //       isLoading.value = false;
    //     }
    //   });
    //   isLoading.value = false;
    // }

    // getexpertisedata() async {
    //   ApiClient apiClient = ApiClient();
    //   await apiClient.getRequest(ApiUrls.getexpertise).then((value) {
    //     if (value != null) {
    //       expertiselist.value = List<ExpertiseModel>.from(
    //           value["data"].map((e) => ExpertiseModel.fromJson(e)));
    //     }
    //   });
    Get.toNamed(Routes.languageview);
  }

  onexpertisetap(ExpertiseModel model) {
    if (selectedexpertise.any((element) => element.id == model.id)) {
      selectedexpertise.removeWhere((element) => element.id == model.id);
    } else {
      selectedexpertise.add(model);
    }
  }
}
