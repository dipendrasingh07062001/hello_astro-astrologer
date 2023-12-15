import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../theme/colorpalatt.dart';
import '../../../util/buttons.dart';
import '../../../util/images.dart';
import '../../widgets/space.dart';
import '../../widgets/textwidgets.dart';

class ChatScreen extends GetView {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> msgs = [
      chatcard(
        alignment: Alignment.centerLeft,
        backgroundColor: Palatt.blueshadelight,
        msg:
            "Welcome to Hello Astrologer. Consultant will take a minute to prepare your chart. You may ask your question in the meanwhile",
      ),
      chatcard(
        msg:
            "Hi Udayy,\nBelow are my details : \nName : Rajesh Kumar \nGender : Male \nDOB : 28-Feb-1996 \nTOB : 2:30 PM \nPOB : Homnabad, Karnataka, India \nMarital Status : Single \nOccupation : Private Sector \nProblem Area : Career and Business \nQuestion : undefined \nQuestion : undefined",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 0,
        leadingWidth: 40,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 27,
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-JXTGHFY17JKveGhEsuP2rz0qxFMoKb6eHg&usqp=CAU",
              ),
            ),
            spaceHorizontal(14),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Harry John",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Palatt.black,
                      height: 1.2),
                ),
                Text(
                  "End",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Palatt.primary,
                      height: 1.2),
                ),
                // Text(
                //   "Chat in-Progress",
                //   style: TextStyle(
                //       fontSize: 12,
                //       fontWeight: FontWeight.w500,
                //       color: Palatt.black,
                //       height: 1.2),
                // )
              ],
            )
          ],
        ),
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
                      textStyle(
                        "50 Mins",
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
          spaceHorizontal(15)
        ],
      ),
      body: Container(
        height: Get.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.background2), fit: BoxFit.contain)),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView.separated(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: msgs.length,
                  itemBuilder: (context, index) {
                    return msgs[index];
                  },
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                ),
              ),
            ),
            typemessage()
          ],
        ),
      ),
      // floatingActionButton: ,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget typemessage() => Container(
        width: Get.width,
        // height: 80,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 18,
        ),
        decoration: const BoxDecoration(
            color: Palatt.white,
            boxShadow: [BoxShadow(color: Palatt.boxShadow, blurRadius: 4)]),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              cursorColor: Palatt.primary,
              cursorWidth: 1,
              cursorHeight: 15,
              maxLines: 5,
              minLines: 1,
              style: const TextStyle(
                  fontSize: 13, color: Palatt.black, height: 1.5),
              decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  filled: true,
                  fillColor: Palatt.white,
                  hintText: "Type a message",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: SvgPicture.asset(
                      AppImages.emoji,
                      height: 15,
                      width: 15,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  hintStyle: const TextStyle(
                      color: Palatt.grey, fontSize: 13, height: 2),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Palatt.grey,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Palatt.primary,
                      )),
                  focusColor: Palatt.primary,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          child: SvgPicture.asset(
                            AppImages.attachment,
                            height: 20,
                            width: 20,
                            color: Palatt.grey,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(
                            Icons.camera_alt,
                            color: Palatt.grey,
                            size: 25,
                            // height: 10,
                            // width: 10,
                          ),
                        ),
                      ),
                    ],
                  )),
            )),
            spaceHorizontal(10),
            SvgPicture.asset(
              AppImages.send,
              height: 50,
              width: 50,
            ),
          ],
        ),
      );

  Widget chatcard({
    AlignmentGeometry alignment = Alignment.centerRight,
    String msg = "",
    Color backgroundColor = Palatt.yellowshade1,
  }) =>
      Align(
        alignment: alignment,
        child: Container(
          constraints: BoxConstraints(maxWidth: Get.width * 0.65),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(10),
              bottomRight: const Radius.circular(10),
              topLeft: alignment == Alignment.centerLeft
                  ? Radius.zero
                  : const Radius.circular(10),
              topRight: alignment == Alignment.centerRight
                  ? Radius.zero
                  : const Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msg,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Palatt.black,
                ),
              ),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text(
              //       "06:30 PM",
              //       style: TextStyle(
              //         fontSize: 13,
              //         fontWeight: FontWeight.w400,
              //         color: Palatt.greyshade1,
              //       ),
              //     ),
              //     spaceHorizontal(10),
              //     SvgPicture.asset(
              //       AppImages.check,
              //       height: 18,
              //       width: 18,
              //       color: Palatt.greyshade1,
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      );
}
