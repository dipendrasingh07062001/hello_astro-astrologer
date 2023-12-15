import 'package:get/get.dart';

class HelpNSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpNSupportController());
  }
}

class HelpNSupportController extends GetxController {
  RxInt currenttab = 0.obs;
  changetab(int index) => currenttab.value = index;
}
