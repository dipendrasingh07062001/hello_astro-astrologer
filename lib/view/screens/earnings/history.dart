import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/theme/themedata.dart';
import 'package:astro/util/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../util/images.dart';
import '../../../util/textstyles.dart';
import '../../widgets/space.dart';

class EarningHistory extends StatelessWidget {
  const EarningHistory({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> findorder = [
      spaceVertical(30),
      Text("From Date (DD-MM-YY)",
          style: googleFontstyle(
            TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          )),
      spaceVertical(5),
      RRButton2(
        onTap: () {},
        padding: const EdgeInsets.only(
          left: 10,
          right: 15,
        ),
        height: 45,
        borderColor: Palatt.primary,
        radius: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("08-07-2022",
                style: googleFontstyle(
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            SvgPicture.asset(
              AppImages.calendar,
              height: 20,
            )
          ],
        ),
      ),
      spaceVertical(22),
      Text("End Date (DD-MM-YY)",
          style: googleFontstyle(
            TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          )),
      spaceVertical(5),
      RRButton2(
        onTap: () {},
        padding: const EdgeInsets.only(
          left: 10,
          right: 15,
        ),
        height: 45,
        borderColor: Palatt.primary,
        radius: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("08-07-2022",
                style: googleFontstyle(
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            SvgPicture.asset(
              AppImages.calendar,
              height: 20,
            )
          ],
        ),
      ),
      spaceVertical(32),
      RRButton(
        onTap: () {},
        data: "Generate Statement",
        style: googleFontstyle(
          const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Palatt.primary),
        ),
        borderColor: Palatt.primary,
        radius: 10,
        height: 50,
      ),
      spaceVertical(15),
      RRButton(
        onTap: () {},
        data: "Find Order",
        style: googleFontstyle(
          const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Palatt.white),
        ),
        backgroundColor: Palatt.primary,
        radius: 10,
        height: 50,
      ),
      spaceVertical(20),
    ];
    Widget earningcard = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: Palatt.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Palatt.boxShadow,
              blurRadius: 6,
            )
          ]),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Duration : 122",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Earning : ₹8.5",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          spaceVertical(5),
          const Text(
            "Transaction Id : 2354",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Promotional Minutes : 189",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Billable Minutes : 0",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Palatt.white,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 40,
        title: Text("Earning History",
            style: googleFontstyle(
              TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Palatt.black,
              ),
            )),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Get.toNamed(Routes.walletBalance);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Palatt.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: Get.height * .036,
                  // width: w * .22,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        AppImages.wallet,
                        height: 12,
                        width: 14,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      textStyle(
                        "₹ 200",
                        Palatt.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      // textStyle("₹ 200", Palatt.white,
                      //     w * .039, FontWeight.bold),
                    ],
                  ),
                ),
              ),
            ],
          ),
          spaceHorizontal(15),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [...findorder, ...List.generate(3, (index) => earningcard)],
      ),
    );
  }
}
