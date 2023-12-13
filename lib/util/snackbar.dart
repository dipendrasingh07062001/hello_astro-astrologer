import 'package:astro/theme/colorpalatt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nevugationservices.dart';

showcustomSnackBar(String message) {
  ScaffoldMessenger.of(NavigationServices.context).showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.only(bottom: Get.height * 0.2),
      elevation: 0,
      content: Center(
        child: Container(
          alignment: Alignment.center,
          width: Get.width / 4,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Palatt.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
          ),
        ),
      )));
}

redsnackbar(String message) {
  ScaffoldMessenger.of(NavigationServices.context).showSnackBar(SnackBar(
    backgroundColor: Palatt.red,
    // padding: EdgeInsets.only(bottom: height * 0.2),
    elevation: 8,
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
  ));
}
