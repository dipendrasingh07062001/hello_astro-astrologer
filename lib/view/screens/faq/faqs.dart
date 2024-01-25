import 'package:astro/services/localization/keywords.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colorpalatt.dart';
import '../../../util/images.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/space.dart';

class FAQs extends GetView {
  const FAQs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Words.FAQ.tr),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          AppImages.background2,
        ))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceVertical(15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "FAQs",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Palatt.black,
                ),
              ),
            ),
            spaceVertical(15),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Palatt.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Palatt.boxShadow,
                            blurRadius: 6,
                          )
                        ]),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      iconColor: Palatt.black,
                      collapsedIconColor: Palatt.black,
                      backgroundColor: Palatt.white,
                      title: const Text(
                        "Lorem ipsum",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Palatt.black,
                        ),
                      ),
                      childrenPadding: const EdgeInsets.all(10),
                      children: [
                        const Text(
                          "Lorem ipsum, or lapsus as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Fin bus Bono rum et Malo rum for use.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Palatt.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
