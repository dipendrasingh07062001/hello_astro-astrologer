import 'package:astro/view/screens/contactus/view.dart';
import 'package:astro/view/screens/bankdetails/view.dart';
import 'package:astro/view/screens/faq/faqs.dart';
import 'package:astro/view/screens/profile/view.dart';
import 'package:astro/view/screens/reviews/view.dart';
import 'package:astro/view/screens/earnings/history.dart';
import 'package:astro/view/screens/helpnsupport/helpnsupport.dart';
import 'package:astro/view/screens/contact/chat_current.dart';
import 'package:astro/view/screens/homenavbar/home_nav.dart';
import 'package:astro/util/appwebview.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../controller/helpnsupport/controller.dart';
import '../controller/homenavcontroller/homenav_controller.dart';
import '../controller/onboarding/languagecontroller.dart';
import '../view/screens/followers/view.dart';
import '../view/screens/notification/view.dart';
import '../view/screens/chat/view.dart';
import '../view/screens/aboutus/view.dart';
import '../view/screens/contact/call_current.dart';
import '../view/screens/home/home_page.dart';
import '../view/screens/onboard/languageselectview.dart';
import '../view/screens/onboard/login_astro.dart';
import '../view/screens/onboard/signup.dart';
import '../view/screens/onboard/verification_otp.dart';
import '../view/screens/privacypolicy/view.dart';
import '../view/screens/splash/splash_screen.dart';
import '../view/screens/termsncondition/view.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const otpverification = _Paths.otpverification;
  static const home = _Paths.home;
  static const homeNav = _Paths.homeNav;
  static const signup = _Paths.signup;
  static const webview = _Paths.webview;
  static const aboutus = _Paths.aboutus;
  static const privacypolicy = _Paths.privacypolicy;
  static const termsncondition = _Paths.termsncondition;
  static const languageview = _Paths.languageview;
  static const callview = _Paths.callview;
  static const chatview = _Paths.chatview;
  static const notification = _Paths.notification;
  static const chat = _Paths.chat;
  static const earningHistory = _Paths.earningHistory;
  static const helpnsupport = _Paths.helpnsupport;
  static const followersview = _Paths.followersview;
  static const reviewsview = _Paths.reviewsview;
  static const profileView = _Paths.profileView;
  static const faqs = _Paths.faqs;
  static const bankdetails = _Paths.bankdetails;
  static const contactUs = _Paths.contactUs;
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
  static const aboutus = '/aboutus';
  static const privacypolicy = '/privacypolicy';
  static const termsncondition = '/termsncondition';
  static const languageview = '/languageview';
  static const callview = '/callview';
  static const chatview = '/chatview';
  static const notification = '/notification';
  static const chat = '/chat';
  static const earningHistory = '/earningHistory';
  static const helpnsupport = '/helpnsupport';
  static const followersview = '/followersview';
  static const reviewsview = '/reviewsview';
  static const profileView = '/profileView';
  static const faqs = '/faqs';
  static const bankdetails = '/bankdetails';
  static const contactUs = '/contactUs';
}

class AppPages {
  AppPages._();
  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: _Paths.contactUs, page: () => ContactUs()),
    GetPage(name: _Paths.profileView, page: () => ProfileView()),
    GetPage(name: _Paths.faqs, page: () => FAQs()),
    GetPage(name: _Paths.bankdetails, page: () => UpdateBankDetails()),
    GetPage(name: _Paths.reviewsview, page: () => ReviewsView()),
    GetPage(name: _Paths.followersview, page: () => FollowersView()),
    GetPage(name: _Paths.chat, page: () => ChatScreen()),
    GetPage(
        name: _Paths.helpnsupport,
        page: () => HelpNSupport(),
        binding: HelpNSupportBinding()),
    GetPage(name: _Paths.earningHistory, page: () => EarningHistory()),
    GetPage(name: _Paths.webview, page: () => AppWebView()),
    GetPage(name: _Paths.splash, page: () => SplashScreen()),
    GetPage(
        name: _Paths.login,
        page: () => LoginAstro(
              phone: '',
            )),
    GetPage(name: _Paths.otpverification, page: () => Verification()),
    GetPage(name: _Paths.home, page: () => HomeView()),
    GetPage(name: _Paths.signup, page: () => Signup()),
    GetPage(name: _Paths.aboutus, page: () => AboutUs()),
    GetPage(name: _Paths.privacypolicy, page: () => PrivacyPolicy()),
    GetPage(name: _Paths.termsncondition, page: () => TermsAndCondition()),
    GetPage(
        name: _Paths.homeNav,
        page: () => const HomeNavBar(),
        binding: HomeNavBinding()),
    GetPage(
      name: _Paths.languageview,
      page: () => LanguageSelectView(),
      binding: LanguageBinding(),
    ),
    GetPage(name: _Paths.callview, page: () => CallCurrentScreen()),
    GetPage(name: _Paths.chatview, page: () => ChatCurrentScreen()),
    GetPage(name: _Paths.notification, page: () => NotificationView()),
  ];
}
