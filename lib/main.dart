import 'package:astro/helper/route_helper.dart';
import 'package:astro/view/screens/homenavbar/home_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
      initialRoute: '/',
      getPages: RoutesPage.getPages,
      // theme: ThemeData(fontFamily: 'Hind'),
      debugShowCheckedModeBanner: false,
      home: const HomeNav(),
    );
  }
}
