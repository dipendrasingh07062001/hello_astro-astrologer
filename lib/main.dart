import 'package:astro/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'view/screens/onboard/login_astro.dart';
import 'view/screens/onboard/signup.dart';
import 'view/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const HelloAstrologer());
}

class HelloAstrologer extends StatelessWidget {
  const HelloAstrologer({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
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
      ],

      // theme: ThemeData(fontFamily: 'Hind'),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
