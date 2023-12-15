import 'dart:developer';

import 'package:astro/helper/route_helper.dart';
import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/util/images.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
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

  Future<void> _loadIndicatorImage() async {
    await precacheImage(const AssetImage(AppImages.splashpic), context);
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(AppImages.splashpic),
      logoWidth: 130,

      // title: Text(
      //   "Title",
      //   style: TextStyle(
      //     fontSize: 18,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      backgroundColor: Palatt.primary,
      showLoader: true,
      // loadingText: Text("Loading..."),
      // navigator: ,
      loaderColor: Palatt.primary,
      durationInSeconds: 3,
    );
    Container(
      height: Get.height,
      width: Get.width,
      color: Palatt.primary,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
      alignment: Alignment.center,
      child: SizedBox(
          width: w * .6,
          child: FutureBuilder(
            future: _loadIndicatorImage(),
            builder: (context, snapshot) {
              return Image.asset(
                AppImages.splashpic,
                // "https://images.unsplash.com/photo-1498462440456-0dba182e775b?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                errorBuilder: (context, error, stackTrace) {
                  log(error.toString());
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(error.toString())));
                  setState(() {});
                  return Container();
                },
                // color: Palatt.white,
              );
            },
          )),
    );
    Scaffold(
        backgroundColor: Palatt.primary,
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            // height: Get.height * 0.6,
            width: Get.width * 0.6,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                    image: AssetImage(
                      AppImages.background2,
                    ))),
          ),
        )
        //  Center(
        //   child: SizedBox(
        //     width: w * .6,
        //     child: Image.asset(
        //       AppImages.splashpic,
        //       errorBuilder: (context, error, stackTrace) {
        //         setState(() {});
        //         return Container();
        //       },
        //       // color: Palatt.white,
        //     ),
        //   ),
        // ),
        );
  }
}
