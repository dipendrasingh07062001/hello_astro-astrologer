import 'package:get/get.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}

class LanguageController extends GetxController {
  RxBool isLoading = false.obs;
  RxString selectedlanguage = "".obs;
  selectlang(String lang) {
    selectedlanguage.value = lang;
  }
}
