import 'package:astro/api/preference.dart';
import 'package:astro/helper/route_helper.dart';
import 'package:astro/util/nevugationservices.dart';
import 'package:astro/view/screens/homenavbar/home_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Preference.getInstance();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const HelloAstrologer());
}

class HelloAstrologer extends StatelessWidget {
  const HelloAstrologer({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.initial,
      navigatorKey: NavigationServices.navigatorKey,
      getPages: AppPages.routes,
      // theme: ThemeData(fontFamily: 'Hind'),
      debugShowCheckedModeBanner: false,
    );
  }
}
