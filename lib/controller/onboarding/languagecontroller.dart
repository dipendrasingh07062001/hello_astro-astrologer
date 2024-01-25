import 'dart:ui';

import 'package:get/get.dart';

import '../../api/preference.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}

class LanguageController extends GetxController {
  @override
  void onInit() {
    selectedlanguage.value = Preference.getString(PreferenceConstants.language);
    super.onInit();
  }

  RxBool isLoading = false.obs;
  List languages = [
    {"language": "English", "local": const Locale('en', 'US')},
    {"language": "हिंदी", "local": const Locale('hi', 'IN')},
  ];
  RxString selectedlanguage = "".obs;
  selectlang(int index) {
    selectedlanguage.value = languages[index]["language"];
    Get.updateLocale(languages[index]["local"]);
    Preference.setString(
        PreferenceConstants.language, languages[index]["language"]);
  }
}
