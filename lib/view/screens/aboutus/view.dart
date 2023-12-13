import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../theme/colorpalatt.dart';
import '../../../util/images.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/space.dart';

class AboutUs extends GetView {
  const AboutUs({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "About us",
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          AppImages.background2,
        ))),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceVertical(15),
            Text(
              "About us",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: Palatt.black,
              ),
            ),
            Text(
              """Lorem ipsum, or lapsus as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Fin bus Bono rum et Malo rum for use.
      There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.
      If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.
      There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.
      If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.""",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Palatt.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
