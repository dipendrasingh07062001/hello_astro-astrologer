import 'package:astro/helper/route_helper.dart';
import 'package:astro/services/localization/keywords.dart';
import 'package:astro/util/buttons.dart';
import 'package:astro/view/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../theme/colorpalatt.dart';
import '../../widgets/custom_appbar.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palatt.white,
      appBar: CustomAppBar(
          title: Words.Chat_Room.tr, automaticallyImplyLeading: false),
      body: Column(children: [
        Expanded(
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 5, left: 15, right: 15),
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
                    tabs: [
                      Tab(
                        text: Words.History.tr,
                      ),
                      Tab(
                        text: Words.LiveChat.tr,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                hintText: "${Words.Searchhere.tr}...",
                                isCollapsed: true,
                                isDense: true,
                                hintStyle: const TextStyle(
                                  color: Palatt.grey,
                                  fontSize: 16,
                                ),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: Palatt.grey,
                                  size: 20,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      width: .5, color: Palatt.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      width: .5, color: Palatt.grey),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 90),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, index) {
                                  return usercard();
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: Palatt.boxShadow.withOpacity(0.5),
                                    thickness: 1,
                                    height: 1,
                                  );
                                },
                                itemCount: 10),
                          )
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

  Widget usercard() => GestureDetector(
        onTap: () {
          Get.toNamed(Routes.chat);
        },
        child: Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
          color: Palatt.white,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 27.5,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-JXTGHFY17JKveGhEsuP2rz0qxFMoKb6eHg&usqp=CAU"),
              ),
              spaceHorizontal(11),
              const Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ajendra Kumar",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Hi, How are you",
                    style: TextStyle(
                      fontSize: 11,
                      color: Palatt.grey,
                    ),
                  ),
                ],
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "12.00 PM",
                    style: TextStyle(
                      fontSize: 12,
                      color: Palatt.grey,
                    ),
                  ),
                  spaceVertical(5),
                  const CircleAvatar(
                    radius: 11,
                    backgroundColor: Palatt.primary,
                    child: Text(
                      "3",
                      style: TextStyle(
                        fontSize: 12,
                        color: Palatt.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
