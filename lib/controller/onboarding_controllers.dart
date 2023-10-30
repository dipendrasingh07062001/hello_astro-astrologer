import 'dart:io';

import 'package:astro/data/model/expertise_model.dart';
import 'package:astro/util/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../api/apiconstants.dart';
import '../api/apiservices.dart';
import '../data/model/language_model.dart';
import '../helper/route_helper.dart';
import '../util/colors.dart';
import '../util/textstyles.dart';
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
  RxBool isSelected = false.obs;
  RxBool showexpertise = false.obs;
  RxBool directoryselected = true.obs;
  RxList<LanguageModel> languageList = RxList();
  Rxn<ExpertiseModel> selectedexpertise =
      Rxn<ExpertiseModel>(ExpertiseModel(name: "", id: 0, image: ""));
  RxList<ExpertiseModel> expertiselist = RxList();

  // List language = [
  //   {"language": "Hindi", "isSelected": false},
  //   {"language": "English", "isSelected": false},
  // ];
  String gender = 'Gender';
  // google login api
  String? name;
  String? email;
  String? profilePic;
  RxString filePath = ''.obs;

  Widget getprofileImage() {
    if (profileImage.value == "") {
      return CircleAvatar(
        radius: 75,
        backgroundColor: AppColor.colGrey.withOpacity(0.1),
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
  }

  onlogin(BuildContext context) {
    if (mobileController.text.isEmpty) {
      Get.rawSnackbar(
          messageText: textStyle("Please enter your phone number",
              AppColor.colWhite, Get.width * .04, FontWeight.w500),
          backgroundColor: Colors.red);

      return;
    }

    if (mobileController.text.length != 10) {
      Get.rawSnackbar(
          messageText: textStyle("Please enter valid phone number",
              AppColor.colWhite, Get.width * .04, FontWeight.w500),
          backgroundColor: Colors.red);

      return;
    }

    // if (!isSelected.value) {
    //   Get.rawSnackbar(
    //       messageText: textStyle(
    //           "Please accept Terms and Conditions to continue",
    //           AppColor.colWhite,
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

  onsignup(BuildContext context) async {
    isLoading.value = true;
    ApiClient apiClient = ApiClient();
    List<http.MultipartFile> files = [];
    Map<String, String> map = {
      "phone": mobileController.text,
      "name": nameController.text,
      "email": emailController.text,
      "experience": expController.text,
      "expertise[]": selectedexpertise.value!.id.toString(),
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
  }

  verifyotp(String otp) async {
    isLoading.value = true;
    ApiClient apiClient = ApiClient();
    Map<String, String> map = {"phone": mobileController.text, "otp": otp};
    await apiClient.postRequest(ApiUrls.verifiotp, map).then((value) {
      if (value != null) {
        print("==$value");
        Get.toNamed(Routes.home);
        isLoading.value = false;
      }
    });
    isLoading.value = false;
  }

  getexpertisedata() async {
    ApiClient apiClient = ApiClient();
    await apiClient.getRequest(ApiUrls.getexpertise).then((value) {
      if (value != null) {
        expertiselist.value = List<ExpertiseModel>.from(
            value["data"].map((e) => ExpertiseModel.fromJson(e)));
      }
    });
  }

  onexpertisetap(ExpertiseModel model) {
    selectedexpertise.value = model;
  }

//   Future googleLogin() async {
//     // var familyname;
//     GoogleSignIn googleSignIn = GoogleSignIn();
//     try {
//       var reslut = await googleSignIn.signIn();
//       if (reslut != null) {
//         final userData = await reslut.authentication;
//         final credential = GoogleAuthProvider.credential(
//             accessToken: userData.accessToken, idToken: userData.idToken);

//         await FirebaseAuth.instance.signInWithCredential(credential);
//         // print("family name: "+ )
//         name = reslut.displayName.toString();
//         // firstName = finalResult.additionalUserInfo?.profile!["given_name"];
//         // lastName = finalResult.additionalUserInfo?.profile!["family_name"];

//         email = reslut.email.toString();

//         socialSignup(name.toString(), email.toString(), "2");

//         // print("name: " + name);
//         // print("email: " + email);

//         return true;
//       }

//       return false;
//     } catch (error) {
//       log(error.toString());
//     }
//   }

// // social login api

//   Future<dynamic> socialSignup(String name, String email, String type) async {
//     final box = GetStorage();
//     isLoading.value = true;
//     var res = await http.post(Uri.parse(googleSignupUrl), body: {
//       'name': name.toString(),
//       'email': email.toString(),
//       "type": type
//     });

//     if (res.statusCode == 200) {
//       var data = jsonDecode(res.body);
//       var msg = data["message"].toString();

//       if (data['status'] == true) {
//         box.write(UserData.id, data['data']['id']);
//         box.write(UserData.name, data['data']['name']);
//         box.write(UserData.experience, data['data']['experience']);
//         box.write(UserData.expertise, data['data']['expertise']);
//         box.write(UserData.skills, data['data']['skills']);
//         box.write(UserData.phone, data['data']['phone']);
//         box.write(UserData.email, data['data']['email']);
//         box.write(UserData.gender, data['data']['gender']);
//         box.write(UserData.city, data['data']['city']);
//         box.write(UserData.country, data['data']['country']);
//         box.write(UserData.systemKnown, data['data']['system_known']);
//         box.write(UserData.shortBio, data['data']['short_bio']);
//         box.write(UserData.conversationType, data['data']['conversation_type']);
//         box.write(UserData.socialType, data['data']['social_type']);
//         box.write(UserData.astrology, data['data']['astrology']);
//         box.write(UserData.price, data['data']['price']);
//         box.write(UserData.description, data['data']['description']);
//         box.write(UserData.image, data['data']['image']);
//         box.write(UserData.coverImage, data['data']['cover_image']);
//         box.write(UserData.galleryImage, data['data']['gallery_image']);
//         box.write(UserData.icon, data['data']['icon']);
//         box.write(UserData.panCard, data['data']['pan_card']);
//         box.write(UserData.aadharCard, data['data']['aadhar_card']);
//         box.write(UserData.language, data['data']['language']);
//         box.write(UserData.status, data['data']['status']);
//         box.write(UserData.approveStatus, data['data']['approve_status']);
//         box.write(UserData.monetize, data['data']['monetize']);

//         box.write(UserData.isLogin, data['data']['is_login']);
//         box.write(UserData.token, data["token"] ?? "");
//         Get.to(() =>
//             data['data']['is_login'] ? HomeNav(index: 0) : const Signup());
//         data['data']['is_login']
//             ? Get.rawSnackbar(
//                 messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//                 backgroundColor: Colors.green)
//             : null;
//       } else {
//         // Get.snackbar(msg, "");
//         Get.rawSnackbar(
//             messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//             backgroundColor: Colors.red);

//         isLoading.value = false;
//       }
//     } else {
//       isLoading.value = false;
//     }
//   }

//   // signup api

//   astroSignup(String phone) async {
//     isLoading.value = true;

//     var res = await http.post(Uri.parse(signUpUrl), body: {'phone': phone});

//     if (res.statusCode == 200) {
//       var data = jsonDecode(res.body);
//       var msg = data["message"].toString();

//       if (data['status'] == true) {
//         Get.to(() => Verification(phone: phone));

//         // Get.rawSnackbar(
//         //     messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//         //     backgroundColor: Colors.green);
//         isLoading.value = false;
//       } else {
//         Get.rawSnackbar(
//             messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//             backgroundColor: Colors.red);

//         isLoading.value = false;
//       }
//     } else {
//       isLoading.value = false;
//     }
//   }

//   // signup form api

//   signupForm() async {
//     final box = GetStorage();
//     isLoading.value = true;

//     try {
//       var res = await http.post(Uri.parse(signupFormUrl), body: {
//         'name': nameController.text,
//         'gender': gender,
//         'phone': mobileController.text,
//         'email': emailController.text,
//         'experience': expController.text,
//         'city': cityController.text,
//         'country': countryController.text,
//         'system_known': systemController.text,
//         'conversation_type': 'chat',
//         'ids': languageList
//             .where((p) => p.isSelected)
//             .map((e) => e.id)
//             .toList()
//             .join(', '),
//         'short_bio': bioController.text,
//       });

//       if (res.statusCode == 200) {
//         var data = jsonDecode(res.body);
//         var msg = data['message'].toString();

//         if (data['status'] == true) {
//           isLoading.value = false;
//           box.write(UserData.name, data['data']['name']);
//           box.write(UserData.experience, data['data']['experience']);
//           box.write(UserData.expertise, data['data']['expertise']);
//           box.write(UserData.skills, data['data']['skills']);
//           box.write(UserData.phone, data['data']['phone']);
//           box.write(UserData.email, data['data']['email']);
//           box.write(UserData.gender, data['data']['gender']);
//           box.write(UserData.city, data['data']['city']);
//           box.write(UserData.country, data['data']['country']);
//           box.write(UserData.systemKnown, data['data']['system_known']);
//           box.write(UserData.shortBio, data['data']['short_bio']);
//           box.write(
//               UserData.conversationType, data['data']['conversation_type']);
//           box.write(UserData.astrology, data['data']['astrology']);
//           box.write(UserData.price, data['data']['price']);
//           box.write(UserData.image, data['data']['image']);
//           box.write(UserData.status, data['data']['status']);
//           box.write(
//               UserData.speakingLanguages, data['data']['speaking_languages']);
//           box.write(UserData.approveStatus, data['data']['approve_status']);

//           box.write(UserData.id, data['data']['id']);

//           Get.offAll(() => LoginAstro(
//               phone:
//                   mobileController.text.trim() /*box.read(UserData.phone)*/));
//           Get.rawSnackbar(
//               messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//               backgroundColor: Colors.green);

//           // setState(() {});
//         } else {
//           Get.rawSnackbar(
//               messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//               backgroundColor: Colors.red);

//           isLoading.value = false;

//           // setState(() {});
//         }
//       } else {
//         isLoading.value = false;

//         // setState(() {});
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   // for resend (on login screen)
//   Future<dynamic> resendSignupApi(String phone) async {
//     isLoading.value = true;

//     var res = await http.post(Uri.parse(signUpUrl), body: {
//       "phone": phone,
//     });

//     if (res.statusCode == 200) {
//       var data = jsonDecode(res.body);
//       var msg = data['message'];
//       if (data['status'] == true) {
//         Get.rawSnackbar(
//             messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//             backgroundColor: Colors.green);
//         print(msg);

//         isLoading.value = false;

//         // setState(() {});
//       } else {
//         Get.rawSnackbar(
//             messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//             backgroundColor: Colors.red);
//         isLoading.value = false;

//         print(msg);
//         // setState(() {});
//       }
//     } else {
//       isLoading.value = false;

//       // setState(() {});
//     }
//   }

//   // for verification

//   Future<dynamic> veriifyApi(String phone, String otp) async {
//     final box = GetStorage();
//     isLoading.value = true;

//     var res = await http
//         .post(Uri.parse(verifyOtpUrl), body: {"phone": phone, "otp": otp});

//     if (res.statusCode == 200) {
//       // isLoading = true;
//       var data = jsonDecode(res.body);
//       var msg = data['message'].toString();

//       if (data['status'] == true) {
//         Get.rawSnackbar(
//             messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//             backgroundColor: Colors.green);
//         box.write(UserData.id, data['data']['id']);
//         box.write(UserData.name, data['data']['name']);
//         box.write(UserData.experience, data['data']['experience']);
//         box.write(UserData.expertise, data['data']['expertise']);
//         box.write(UserData.skills, data['data']['skills']);
//         box.write(UserData.phone, data['data']['phone']);
//         box.write(UserData.email, data['data']['email']);
//         box.write(UserData.gender, data['data']['gender']);
//         box.write(UserData.city, data['data']['city']);
//         box.write(UserData.country, data['data']['country']);
//         box.write(UserData.systemKnown, data['data']['system_known']);
//         box.write(UserData.shortBio, data['data']['short_bio']);
//         box.write(UserData.conversationType, data['data']['conversation_type']);
//         box.write(UserData.socialType, data['data']['social_type']);
//         box.write(UserData.astrology, data['data']['astrology']);
//         box.write(UserData.price, data['data']['price']);
//         box.write(UserData.description, data['data']['description']);
//         box.write(UserData.image, data['data']['image']);
//         box.write(UserData.coverImage, data['data']['cover_image']);
//         box.write(UserData.galleryImage, data['data']['gallery_image']);
//         box.write(UserData.icon, data['data']['icon']);
//         box.write(UserData.panCard, data['data']['pan_card']);
//         box.write(UserData.aadharCard, data['data']['aadhar_card']);
//         box.write(UserData.language, data['data']['language']);
//         box.write(UserData.status, data['data']['status']);
//         box.write(UserData.approveStatus, data['data']['approve_status']);
//         box.write(UserData.monetize, data['data']['monetize']);
//         box.write(UserData.token, data["token"]);

//         Get.offAll(() => Language(phone: phone));
//         Get.offAll(() => data['data']['language'] != null
//             ? HomeNav(index: 0)
//             : Language(
//                 phone: phone,
//               ));

//         isLoading.value = false;

//         // setState(() {});
//       } else {
//         Get.rawSnackbar(
//             messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//             backgroundColor: Colors.red);
//         isLoading.value = false;

//         // setState(() {});
//       }
//     } else {
//       isLoading.value = false;

//       // setState(() {});
//     }
//   }

//   // language api

//   Future<dynamic> languageApi(String phone, String language) async {
//     final box = GetStorage();
//     print("language: $language");
//     print("phone: $phone");
//     isLoading.value = true;
//     var res = await http.post(Uri.parse(languageUrl),
//         body: {"phone": phone, "language": language});

//     if (res.statusCode == 200) {
//       isLoading.value = true;

//       var data = jsonDecode(res.body);
//       var msg = data['message'].toString();

//       if (data['status'] == true) {
//         box.write(UserData.id, data['data']['id']);
//         box.write(UserData.name, data['data']['name']);
//         box.write(UserData.experience, data['data']['experience']);
//         box.write(UserData.expertise, data['data']['expertise']);
//         box.write(UserData.skills, data['data']['skills']);
//         box.write(UserData.phone, data['data']['phone']);
//         box.write(UserData.email, data['data']['email']);
//         box.write(UserData.gender, data['data']['gender']);
//         box.write(UserData.city, data['data']['city']);
//         box.write(UserData.country, data['data']['country']);
//         box.write(UserData.systemKnown, data['data']['system_known']);
//         box.write(UserData.shortBio, data['data']['short_bio']);
//         box.write(UserData.conversationType, data['data']['conversation_type']);
//         box.write(UserData.socialType, data['data']['social_type']);
//         box.write(UserData.astrology, data['data']['astrology']);
//         box.write(UserData.price, data['data']['price']);
//         box.write(UserData.description, data['data']['description']);
//         box.write(UserData.image, data['data']['image']);
//         box.write(UserData.coverImage, data['data']['cover_image']);
//         box.write(UserData.galleryImage, data['data']['gallery_image']);
//         box.write(UserData.icon, data['data']['icon']);
//         box.write(UserData.panCard, data['data']['pan_card']);
//         box.write(UserData.aadharCard, data['data']['aadhar_card']);
//         box.write(UserData.language, data['data']['language']);
//         box.write(
//             UserData.speakingLanguages, data['data']['speaking_languages']);
//         box.write(UserData.status, data['data']['status']);
//         box.write(UserData.approveStatus, data['data']['approve_status']);
//         box.write(UserData.monetize, data['data']['monetize']);

//         Get.rawSnackbar(
//             messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//             backgroundColor: Colors.green);
//         Get.offAll(() => HomeNav(index: 0));

//         print(msg);

//         isLoading.value = false;

//         // setState(() {});
//       } else {
//         Get.rawSnackbar(
//             messageText: textStyle(msg, colWhite, 16, FontWeight.w500),
//             backgroundColor: Colors.red);
//         isLoading.value = false;

//         print(data["message"]);
//         // setState(() {});
//       }
//     } else {
//       isLoading.value = false;

//       // setState(() {});
//     }
//   }

//   Future getLanguage() async {
//     try {
//       var response = await http.get(Uri.parse(getLanguageUrl));
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data["status"]) {
//           languageList.value = List<LanguageModel>.from(
//               data["data"].map((e) => LanguageModel.fromjson(e)));
//           print(languageList);
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
}
