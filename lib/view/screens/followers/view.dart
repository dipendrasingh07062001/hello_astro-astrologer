import 'package:flutter/material.dart';

import '../../../theme/colorpalatt.dart';
import '../../../theme/themedata.dart';
import '../../../util/buttons.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/space.dart';

class FollowersView extends StatelessWidget {
  const FollowersView({super.key});

  @override
  Widget build(BuildContext context) {
    Widget notificationcard = RRButton2(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      borderColor: Palatt.primary,
      radius: 8,
      margin: const EdgeInsets.only(bottom: 12),
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 27.5,
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-JXTGHFY17JKveGhEsuP2rz0qxFMoKb6eHg&usqp=CAU"),
          ),
          spaceHorizontal(10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Harry John",
                  style: googleFontstyle(
                    const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Text("05-12-2023",
                  style: googleFontstyle(
                    const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Palatt.grey,
                    ),
                  )),
              Text("Jaipur",
                  style: googleFontstyle(
                    const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Palatt.grey,
                    ),
                  )),
            ],
          ))
        ],
      ),
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: "Followers",
      ),
      body: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            return notificationcard;
          }),
    );
  }
}
