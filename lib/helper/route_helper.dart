import 'package:get/get_navigation/get_navigation.dart';

import '../main.dart';
import '../view/screens/onboard/login_astro.dart';
import '../view/screens/onboard/signup.dart';

class RoutesHelper {
  static const route = '/';
  static const loginAstro = '/loginAstro';
  static const termsAndCondition = '/termsAndCondition';
  static const signupForm = '/signupForm';
  static const verification = '/verification';
  static const homeNav = '/homeNav';
}

class RoutesPage {
  static List<GetPage<dynamic>> get getPages => [
        GetPage(name: RoutesHelper.route, page: () => const HelloAstrologer()),
        GetPage(
            name: RoutesHelper.loginAstro,
            page: () => LoginAstro(
                  phone: '',
                )),
        // GetPage(name: RoutesData.termsAndCondition, page: () => TnC()),
        GetPage(name: RoutesHelper.signupForm, page: () => const Signup()),
        // GetPage(
        //     name: RoutesHelper.verification,
        //     page: () => Verification(
        //           phone: '',
        //         )),
        // GetPage(name: RoutesHelper.homeNav, page: () => HomeNav(index: 0))
      ];
}
