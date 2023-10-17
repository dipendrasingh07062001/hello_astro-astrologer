import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Map<String, dynamic>> profileListData = RxList([
    {
      "color1": '0xFFAA076B',
      'color2': '0xFF61045F',
      "image": 'assets/icons/call_head.svg',
      'title': 'Call',
      // "klass": const ContactPage()
    },
    {
      "color1": '0xFF1E46CF',
      'color2': '0xFF100C5E',
      "image": 'assets/icons/chat_1.svg',
      'title': 'Chat',
      // "klass": const ChatScreen()
    },
    {
      "color1": '0xFF7B4397',
      'color2': '0xFFDC2430',
      "image": 'assets/icons/profile.svg',
      'title': 'Profile',
      // "klass": const Profile()
    },

    {
      "color1": '0xFF8541B3',
      'color2': '0xFF732E89',
      "image": 'assets/icons/notification_bell.svg',
      'title': 'Notification',
      // "klass": const Notification1()
    },
    {
      "color1": '0xFF42275A',
      'color2': '0xFF734B6D',
      "image": 'assets/icons/blog.svg',
      'title': 'Blog',
      // "klass": const Blog()
    },

    {
      "color1": '0xFF0063A5',
      'color2': '0xFF0C8BE0',
      "image": 'assets/icons/refund.svg',
      'title': 'Bank Details',
      // "klass": const BankDetails()
    },
    {
      "color1": '0xFF614385',
      'color2': '0xFF516395',
      "image": 'assets/icons/services.svg',
      'title': 'Services',
      // "klass": const Services()
    },
    // {
    //   "color1": '0xFF141E30',
    //   'color2': '0xFF243B55',
    //   "image": 'assets/icons/cashify.svg',
    //   'title': 'Cashify',
    //   // "klass": const Cashify()
    // },
    {
      "color1": '0xFF67A19D',
      'color2': '0xFF22726C',
      "image": 'assets/icons/support_1.svg',
      'title': 'Support',
      // "klass": const HelpNSupport(
      //   tabindex: 0,
      // )
    },
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
    {
      "color1": '0xFFE3AD76',
      'color2': '0xFFDC2430',
      "image": 'assets/icons/settings.svg',
      'title': 'Settings',
      // "klass": const Settings()
    },
  ]);
}
