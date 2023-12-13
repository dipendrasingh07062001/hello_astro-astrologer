import 'package:astro/util/buttons.dart';
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
      appBar: const CustomAppBar(title: "Chat Room"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .04),
        child: Column(children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 5),
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
                          text: "History",
                        ),
                        Tab(
                          text: "Live Chat",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: Get.height * .026,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: Get.width * .03),
                                hintText: "Search here ...",
                                hintStyle: TextStyle(
                                  color: Palatt.grey,
                                  fontSize: 16,
                                ),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Palatt.grey,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(width: .5, color: Palatt.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(width: .5, color: Palatt.grey),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.separated(
                                  itemBuilder: (BuildContext context, index) {
                                    return usercard();
                                  },
                                  separatorBuilder:
                                      (BuildContext context, index) {
                                    return Divider(
                                      color: Palatt.grey,
                                    );
                                  },
                                  itemCount: 6),
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
      ),
    );
  }

  Widget usercard() => ListTile(
        leading: CircleAvatar(
          radius: 20,
          child: SvgPicture.network(""),
        ),
        title: Text(
          "Ajendra Kumar",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          "Hi, How are you",
          style: TextStyle(
            fontSize: 11,
            color: Palatt.grey,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "12.00 PM",
              style: TextStyle(
                fontSize: 12,
                color: Palatt.grey,
              ),
            ),
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
      );
}
