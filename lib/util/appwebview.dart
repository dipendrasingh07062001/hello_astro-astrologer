import 'dart:developer';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class AppWebView extends StatelessWidget {
  AppWebView({super.key});

  AppWebViewController controller =
      Get.put(AppWebViewController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body());
  }

  Widget body() {
    var data = Get.arguments;
    controller.init({"link": "https://syncremote.co"});
    return WebViewWidget(
      controller: controller.webViewController,
    );
  }
}

class AppWebViewController extends GetxController {
  WebViewController webViewController = WebViewController();
  init(Map<String, String> data) async {
    String link = data["link"] ?? "";
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            log("url == $url");
          },
          onWebResourceError: (WebResourceError error) {
            print(error.description);
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(link));
    // await webViewController.loadRequest(Uri.parse(link));
  }
}
