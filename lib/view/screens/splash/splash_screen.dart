import 'package:astro/helper/route_helper.dart';
import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAllNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palatt.primary,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: SizedBox(
            width: w * .8,
            child: Image.asset(
              AppImages.splashpic,
              // color: Palatt.white,
            ),
          ),
        ),
      ),
    );
  }
}
