// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../view/screens/home/home_page.dart';

// class HomeNavController extends GetxController {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   RxBool isDrawerOpen = false.obs;
//   RxInt currentIndex = 0.obs;
//   void onbottomIcontap(int index) {
//     currentIndex.value = index;
//   }

//   List widgets = <Widget>[
//     // const HomePage(),
//     // Category(),
//     Container(),
//     Container(),
//     Container(),
//     // ChatScreen(
//     //   id: "",
//     //   currentOrdersModel: CurrentOrdersModel(),
//     //   isback: false,
//     // ),
//     // Profile()
//   ];

//   opendrawer() {
//     scaffoldKey.currentState!.openDrawer();
//   }

//   // home page drawer list
//   List<Map<String, dynamic>> drawerListData = [
//     {
//       "icon": 'assets/icons/language_d.svg',
//       "title": "Language",
//       // "klass": null,
//     },
//     {
//       "icon": 'assets/icons/16a_d.svg',
//       "title": "Download Form 16A",
//       // "klass": null
//     },
//     {
//       "icon": 'assets/icons/about_s_d.svg',
//       "title": "About Us",
//       // "klass": null,
//     },
//     {
//       "icon": 'assets/icons/helpNsupport_d.svg',
//       "title": 'Help and Support',
//       // "klass": const HelpNSupport(
//       //   tabindex: 0,
//       // )
//     },
//     {
//       "icon": 'assets/icons/tNc_d.svg',
//       "title": 'Terms and Conditions',
//       // "klass": TnC(
//       //   heading: 'Terms and Conditions',
//       //   index: 0,
//       // )
//     },
//     {
//       "icon": 'assets/icons/privacy_d.svg',
//       "title": 'Privacy Policy',
//       // "klass": null
//     },
//     {
//       "icon": 'assets/icons/faq_d.svg',
//       "title": "FAQ",
//       // "klass": null,
//     },
//   ];
// }

import 'package:astro/view/screens/chatroom/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../util/images.dart';
import '../../view/screens/freeservices/view.dart';
import '../../view/screens/home/home_page.dart';
import '../../view/screens/services/view.dart';

class HomeNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeNavController>(() => HomeNavController());
  }
}

class HomeNavController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt currentpage = 0.obs;
  RxList<Widget> body = RxList([
    HomeView(),
    ServicesView(),
    ChatRoomScreen(),
    FreeServices(),
  ]);
  List<Map<String, String>> bar = [
    {
      "name": "Home",
      "image": AppImages.home,
    },
    {
      "name": "Services",
      "image": AppImages.category,
    },
    {
      "name": "Chat",
      "image": AppImages.chaticon,
    },
    {
      "name": "Free Services",
      "image": AppImages.category,
    }
  ];
  ontapbaritem(int index) {
    currentpage.value = index;
  }
}
