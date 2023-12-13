import 'package:astro/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../theme/colorpalatt.dart';
import '../../widgets/custom_appbar.dart';

class CallCurrentScreen extends GetView {
  const CallCurrentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palatt.white,
      appBar: const CustomAppBar(
        title: 'Call',
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
                      borderRadius: BorderRadius.circular(8),
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
                          return CallCurrentCard();
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
                            width: Get.width * .5,
                            height: Get.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: Palatt.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Text(
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
                                return CallHistory();
                              },
                            ),
                          ),
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

class CallCurrentCard extends StatelessWidget {
  const CallCurrentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 18,
        left: Get.width * .05,
        right: Get.width * .05,
      ),
      padding: EdgeInsets.only(
        right: Get.width * .04,
        left: Get.width * .04,
        top: Get.height * .02,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Palatt.boxShadow,
            )
          ]),
      height: Get.height * .18,
      width: Get.width * .07,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                AppImages.incoming_call,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: Get.width * .022,
              ),
              Text(
                "Help",
                style: TextStyle(fontSize: 11, color: Palatt.primary),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 25,
                      child: SvgPicture.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk3Wgo0pmPvbnMUQFekBl33a76j_vK6j0nEQ&usqp=CAU',
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: Get.width * .035,
                  ),
                  Column(
                    children: [
                      Text(
                        "Rajveer Yadav",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .008,
                      ),
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
              Column(
                children: [
                  RichText(
                    text: TextSpan(
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
                  Text("")
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: Get.width * .165, top: Get.height * .01),
                height: Get.height * .042,
                width: Get.width * .17,
                decoration: BoxDecoration(
                    color: Palatt.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
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
                height: Get.height * .042,
                width: Get.width * .17,
                decoration: BoxDecoration(
                    color: Palatt.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Reject",
                  style: TextStyle(
                    fontSize: 12,
                    color: Palatt.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 18,
        left: Get.width * .05,
        right: Get.width * .05,
      ),
      padding: EdgeInsets.only(
        right: Get.width * .04,
        left: Get.width * .04,
        top: Get.height * .02,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Palatt.boxShadow,
            )
          ]),
      height: Get.height * .18,
      width: Get.width * .07,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                AppImages.incoming_call,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: Get.width * .022,
              ),
              Text(
                "Help",
                style: TextStyle(fontSize: 11, color: Palatt.primary),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 0,
                child: CircleAvatar(
                    radius: 25,
                    child: SvgPicture.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk3Wgo0pmPvbnMUQFekBl33a76j_vK6j0nEQ&usqp=CAU',
                      fit: BoxFit.cover,
                    )),
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
                        Text(
                          "Rajesh Sharma",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Expanded(child: SizedBox()),
                        RichText(
                          text: TextSpan(
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Get.height * .008,
                      ),
                      child: Row(
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
                    ),
                    Row(
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
                          "Income : 800 INR",
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
        ],
      ),
    );
  }
}
