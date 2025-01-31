import 'package:astro/api/preference.dart';
import 'package:astro/helper/route_helper.dart';
import 'package:astro/services/localization/keywords.dart';
import 'package:astro/services/localization/language.dart';
import 'package:astro/theme/themedata.dart';
import 'package:astro/util/nevugationservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Preference.getInstance();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const HelloAstrologer());
}

class HelloAstrologer extends StatelessWidget {
  const HelloAstrologer({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      translations: LanguageClass(),
      locale:
          Preference.getString(PreferenceConstants.language).languageValue() ==
                  Language.english
              ? const Locale('en', 'US')
              : const Locale('hi', 'IN'),
      initialRoute: AppPages.initial,
      navigatorKey: NavigationServices.navigatorKey,
      getPages: AppPages.routes,
      theme: AppThemeData.appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

extension on String {
  Language languageValue() {
    switch (this) {
      case "हिंदी":
        return Language.hindi;
      case "English":
        return Language.english;
      default:
        return Language.english;
    }
  }
}
