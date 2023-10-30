import 'package:astro/view/utils/appwebview.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../main.dart';
import '../view/screens/home/home_page.dart';
import '../view/screens/onboard/login_astro.dart';
import '../view/screens/onboard/signup.dart';
import '../view/screens/onboard/verification_otp.dart';
import '../view/screens/splash/splash_screen.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const otpverification = _Paths.otpverification;
  static const home = _Paths.home;
  static const signup = _Paths.signup;
  static const webview = _Paths.webview;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash';
  static const login = '/login';
  static const signup = '/signup';
  static const otpverification = '/otpverification';
  static const home = '/home';
  static const homeNav = '/homeNav';
  static const webview = '/webview';
}

class AppPages {
  AppPages._();
  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: _Paths.webview, page: () => AppWebView()),
    GetPage(name: _Paths.splash, page: () => SplashScreen()),
    GetPage(
        name: _Paths.login,
        page: () => LoginAstro(
              phone: '',
            )),
    GetPage(name: _Paths.otpverification, page: () => Verification()),
    GetPage(name: _Paths.home, page: () => HomePage()),
    GetPage(name: _Paths.signup, page: () => Signup()),
  ];
}
