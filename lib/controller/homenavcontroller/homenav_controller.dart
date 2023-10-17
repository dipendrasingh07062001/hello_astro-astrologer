import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/home/home_page.dart';

class HomeNavController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isDrawerOpen = false.obs;
  RxInt currentIndex = 0.obs;
  void onbottomIcontap(int index) {
    currentIndex.value = index;
  }

  List widgets = <Widget>[
    const HomePage(),
    // Category(),
    Container(),
    Container(),
    Container(),
    // ChatScreen(
    //   id: "",
    //   currentOrdersModel: CurrentOrdersModel(),
    //   isback: false,
    // ),
    // Profile()
  ];

  opendrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  // home page drawer list
  List<Map<String, dynamic>> drawerListData = [
    {
      "icon": 'assets/icons/language_d.svg',
      "title": "Language",
      // "klass": null,
    },
    {
      "icon": 'assets/icons/16a_d.svg',
      "title": "Download Form 16A",
      // "klass": null
    },
    {
      "icon": 'assets/icons/about_s_d.svg',
      "title": "About Us",
      // "klass": null,
    },
    {
      "icon": 'assets/icons/helpNsupport_d.svg',
      "title": 'Help and Support',
      // "klass": const HelpNSupport(
      //   tabindex: 0,
      // )
    },
    {
      "icon": 'assets/icons/tNc_d.svg',
      "title": 'Terms and Conditions',
      // "klass": TnC(
      //   heading: 'Terms and Conditions',
      //   index: 0,
      // )
    },
    {
      "icon": 'assets/icons/privacy_d.svg',
      "title": 'Privacy Policy',
      // "klass": null
    },
    {
      "icon": 'assets/icons/faq_d.svg',
      "title": "FAQ",
      // "klass": null,
    },
  ];
}
