import 'package:astro/helper/route_helper.dart';
import 'package:astro/util/images.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../util/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late double h, w;
  // var box = GetStorage();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAllNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: AppColor.colPrimary),
        child: Center(
          child: SizedBox(
            width: w * .8,
            child: Image.asset(
              AppImages.splashImagePath,
              color: AppColor.colWhite,
            ),
          ),
        ),
      ),
    );
  }
}
