import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../theme/colorpalatt.dart';
import '../../../theme/themedata.dart';
import '../../../util/images.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/space.dart';

class ChatCurrentScreen extends GetView {
  const ChatCurrentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palatt.white,
      appBar: const CustomAppBar(
        title: 'Chat',
        height: 60,
      ),
      body: Column(children: [
        Expanded(
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 15, top: 20, bottom: 5),
                  decoration: BoxDecoration(
                      color: Palatt.primaryLight,
                      border: Border.all(
                        color: Palatt.primary,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  height: 50,
                  child: TabBar(
                    labelPadding: const EdgeInsets.all(8),
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    indicator: BoxDecoration(
                      color: Palatt.primary,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    indicatorWeight: 3,
                    indicatorColor: Palatt.primary,
                    isScrollable: false,
                    unselectedLabelColor: Palatt.primary,
                    labelColor: Colors.white,
                    tabs: const [
                      Tab(
                        text: "Current",
                      ),
                      Tab(
                        text: "History",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListView.builder(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return ChatCurrentCard();
                        },
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: Get.width * .43,
                              top: Get.height * .015,
                            ),
                            padding: EdgeInsets.only(
                              left: Get.width * .03,
                              right: Get.width * .03,
                            ),
                            height: 36,
                            decoration: BoxDecoration(
                              border: Border.all(color: Palatt.boxShadow),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "01-11-2023 - 04-12-2023",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Palatt.primary,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                      left: Get.height * .01,
                                      top: Get.height * .00,
                                    ),
                                    height: Get.height * .06,
                                    width: Get.width * .035,
                                    child: SvgPicture.asset(AppImages.calendar))
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return ChatHistory();
                              },
                            ),
                          ),
                          // Text("Hiiii")
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class ChatCurrentCard extends StatelessWidget {
  const ChatCurrentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 18,
        left: 15,
        right: 15,
      ),
      padding: const EdgeInsets.only(
        right: 11,
        left: 11,
        top: 15,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              color: Palatt.boxShadow,
            )
          ]),
      // height: Get.height * .18,
      width: Get.width * .07,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(AppImages.chaticon,
                  height: 10, color: Palatt.primary),
              SizedBox(
                width: Get.width * .022,
              ),
              const Text(
                "Help",
                style: TextStyle(fontSize: 11, color: Palatt.primary),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk3Wgo0pmPvbnMUQFekBl33a76j_vK6j0nEQ&usqp=CAU"),
                  ),
                  SizedBox(
                    width: Get.width * .035,
                  ),
                  const Column(
                    children: [
                      Text(
                        "Rajveer Yadav",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        "2022-07-11 12:23 PM",
                        style: TextStyle(
                          color: Palatt.grey,
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              RichText(
                text: const TextSpan(
                  text: 'Order Id : 345674321',
                  style: TextStyle(fontSize: 11, color: Palatt.grey, height: 2),
                  children: <TextSpan>[
                    TextSpan(
                        text: '4466',
                        style: TextStyle(
                          color: Palatt.black,
                          fontSize: 11,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: Get.width * .165, top: Get.height * .01),
                height: 24,
                width: 71,
                decoration: BoxDecoration(
                    color: Palatt.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Accept",
                  style: TextStyle(
                    fontSize: 12,
                    color: Palatt.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: Get.width * .02, top: Get.height * .01),
                height: 24,
                width: 71,
                decoration: BoxDecoration(
                    color: Palatt.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Reject",
                  style: TextStyle(
                    fontSize: 12,
                    color: Palatt.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          spaceVertical(15)
        ],
      ),
    );
  }
}

class ChatHistory extends StatelessWidget {
  const ChatHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, left: 15, right: 15),
      padding: const EdgeInsets.only(right: 11, left: 11, top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              color: Palatt.boxShadow,
            )
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                AppImages.chaticon,
                fit: BoxFit.fill,
                color: Palatt.primary,
                height: 10,
              ),
              SizedBox(
                width: Get.width * .022,
              ),
              Text(
                "Help",
                style: googleFontstyle(
                  const TextStyle(
                      fontSize: 11,
                      color: Palatt.primary,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 0,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk3Wgo0pmPvbnMUQFekBl33a76j_vK6j0nEQ&usqp=CAU"),
                ),
              ),
              SizedBox(
                width: Get.width * .035,
              ),
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rajesh Sharma",
                            style: googleFontstyle(
                              const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        // Expanded(child: SizedBox()),
                        RichText(
                          text: const TextSpan(
                            text: 'Order Id : 345674321',
                            style: TextStyle(fontSize: 11, color: Palatt.grey),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '4466',
                                  style: TextStyle(
                                    color: Palatt.black,
                                    fontSize: 11,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "2022-07-11 12:23 PM",
                          style: TextStyle(
                            color: Palatt.grey,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          "Rate : 20/min",
                          style: TextStyle(
                            color: Palatt.grey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Call Duration - 40 min",
                          style: TextStyle(
                            color: Palatt.grey,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          "Promotional : 100 INR",
                          style: TextStyle(
                            color: Palatt.grey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Income : 800 INR",
              style: googleFontstyle(
                const TextStyle(
                    fontSize: 11,
                    color: Palatt.primary,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          spaceVertical(7)
        ],
      ),
    );
  }
}
