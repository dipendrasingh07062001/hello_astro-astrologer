import 'package:astro/helper/route_helper.dart';
import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TheFirstScreen extends StatefulWidget {
  const TheFirstScreen({super.key});

  @override
  State<TheFirstScreen> createState() => _TheFirstScreenState();
}

class _TheFirstScreenState extends State<TheFirstScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAllNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget logo = Image.asset(AppImages.splashpic);
    return Scaffold(
      backgroundColor: Palatt.primary,
      body: Center(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              logo,
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double h = Get.height, w = Get.width;
  var box = GetStorage();
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 500),
        () => Get.to(() => const TheFirstScreen(),
            transition: Transition.downToUp,
            duration: const Duration(seconds: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Palatt.primary,
    );
  }
}
