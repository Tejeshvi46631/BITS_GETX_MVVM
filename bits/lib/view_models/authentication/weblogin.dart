// web_view_view_model.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import '../../GetxController/statecontroller.dart';
import '../../utils/getmethod.dart';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

import 'auth.dart';
import 'authentication_api.dart';

class WebViewViewModel extends GetxController {
  String? redirectUrl;
  bool isLoading = true;
  String? errorMessage;
  late UrlFetcher urlFetcher;
  late WebViewController webViewController;
  final GetMethods getMethods =
      GetMethods(); // Create an instance of GetMethods
  final cookieJar = CookieJar(); // Create a CookieJar instance

  @override
  void onInit() {
    super.onInit();
    urlFetcher = UrlFetcher();
    fetchRedirectUrl();
    Get.put(AppController());
    clearCookies();
    WebviewCookieManager().clearCookies();
  }

  Future<void> clearCookies() async {
    if (Platform.isAndroid || Platform.isIOS) {
      await cookieJar.deleteAll();
      print('Cookies cleared.');
    } else {
      print('Clearing cookies is not supported on this platform.');
    }
  }

  @override
  void onClose() {
    clearCookies();
    super.onClose();
  }

  void fetchRedirectUrl() {
    urlFetcher.fetchRedirectUrl(
      (url) {
        redirectUrl = url;
        isLoading = false;
        update(); // Notify listeners to rebuild
      },
      (error) {
        errorMessage = error;
        isLoading = false;
        update(); // Notify listeners to rebuild
      },
    );
  }

  void setWebViewController(WebViewController controller) {
    webViewController = controller;
  }

  JavascriptChannel jsChannel(BuildContext context) {
    final AppController appController = Get.find();
    final Authentication auth = Authentication();
    return JavascriptChannel(
      name: 'bridge',
      onMessageReceived: (JavascriptMessage message) {
        print('Message received from JavaScript: ${message.message}');
        if (message.message == 'submitClicked') {
          print("CLICKED SUBMIT");
          print('Current state value: ${appController.stateValue}');
        }
        Future.delayed(const Duration(seconds: 2), () {
          auth.dopost();
        });
        // auth.dopost();
      },
    );
  }
}
