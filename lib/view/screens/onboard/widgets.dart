import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colorpalatt.dart';
import '../../../util/textstyles.dart';

// ignore: must_be_immutable
class LanguageTile extends StatelessWidget {
  String text;
  String val;
  String language;
  String country;
  String isTypeSelected;
  void Function()? onTap;
  LanguageTile(this.text, this.val, this.language, this.country,
      {super.key, required this.isTypeSelected, required this.onTap});
  double h = Get.height, w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Palatt.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Palatt.boxShadow,
            spreadRadius: 0,
            blurRadius: 8,
          )
        ],
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        minLeadingWidth: w * .01,
        leading: Container(
          height: w * .055,
          width: w * .055,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: isTypeSelected == val ? Palatt.primary : Palatt.grey,
                width: w * .0044),
          ),
          child: Center(
            child: Container(
              height: w * .043,
              width: w * .043,
              margin: EdgeInsets.all(w * .008),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isTypeSelected == val ? Palatt.primary : Palatt.white,
              ),
            ),
          ),
        ),
        title: textStyle(text, Palatt.black,
            fontSize: w * .039, fontWeight: FontWeight.w500),
      ),
    );
  }
}
