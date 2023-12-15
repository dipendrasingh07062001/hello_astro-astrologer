import 'package:astro/helper/route_helper.dart';
import 'package:astro/util/images.dart';
import 'package:get/get.dart';

import '../homenavcontroller/homenav_controller.dart';

class HomeController extends GetxController {
  openDrawer() {
    Get.find<HomeNavController>().scaffoldKey.currentState!.openDrawer();
  }

  RxList<Map<String, dynamic>> profileListData = RxList([
    {
      "color1": '0xFFAA076B',
      'color2': '0xFF61045F',
      "image": AppImages.callhead,
      'title': 'Call',
      "class": Routes.callview
    },
    {
      "color1": '0xFF8541B3',
      'color2': '0xFF732E89',
      "image": AppImages.notificationhome,
      'title': 'Notification',
      "class": Routes.notification
    },
    {
      "color1": '0xFF1E46CF',
      'color2': '0xFF100C5E',
      "image": AppImages.chatuser,
      'title': 'Chat',
      "class": Routes.chatview
    },
    {
      "color1": '0xFF67A19D',
      'color2': '0xFF22726C',
      "image": AppImages.support,
      'title': 'Support',
      "class": Routes.helpnsupport
    },
    {
      "color1": '0xFF0063A5',
      'color2': '0xFF0C8BE0',
      "image": AppImages.refund,
      'title': 'Bank Details',
      "class": Routes.bankdetails
    },
    {
      "color1": '0xFF7B4397',
      'color2': '0xFFDC2430',
      "image": AppImages.user,
      'title': 'Profile',
      "class": Routes.profileView
    },

    // {
    //   "color1": '0xFF614385',
    //   'color2': '0xFF516395',
    //   "image": 'assets/icons/services.svg',
    //   'title': 'Services',
    //   // "klass": const Services()
    // },
    // {
    //   "color1": '0xFF141E30',
    //   'color2': '0xFF243B55',
    //   "image": 'assets/icons/cashify.svg',
    //   'title': 'Cashify',
    //   // "klass": const Cashify()
    // },

    // {
    //   "color1": '0xFF707070',
    //   'color2': '0xFF48586A',
    //   "image": 'assets/icons/wait.svg',
    //   'title': 'Waitlist',
    //   // "klass": const WaitList()
    // },
    // {
    //   "color1": '0xFF3B6138',
    //   'color2': '0xFF195F00',
    //   "image": 'assets/icons/review.svg',
    //   'title': 'Review',
    //   // "klass": const Review()
    // },
    // {
    //   "color1": '0xFFFF5561',
    //   'color2': '0xFFFF9DA4',
    //   "image": 'assets/icons/listing.svg',
    //   'title': 'Offer',
    //   // "klass": const OfferServices()
    // },
    // {
    //   "color1": '0xFFB87B3E',
    //   'color2': '0xFF6B5238',
    //   "image": 'assets/icons/booking_1.svg',
    //   'title': 'Appointments\n     Booking',
    //   // "klass": const Appointments()
    // },
    // {
    //   "color1": '0xFFE3AD76',
    //   'color2': '0xFFDC2430',
    //   "image": 'assets/icons/settings.svg',
    //   'title': 'Settings',
    //   // "klass": const Settings()
    // },
  ]);
}
