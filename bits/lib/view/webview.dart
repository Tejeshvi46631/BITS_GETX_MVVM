// web_view_page.dart
import 'package:bits/view_models/authentication/authentication_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../view_models/authentication/weblogin.dart';

class WebViewPage extends StatelessWidget {
  final Authentication auth = Authentication();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebViewViewModel>(
      init: WebViewViewModel(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('WebView Example'),
          ),
          body: controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : controller.errorMessage != null
                  ? Center(child: Text(controller.errorMessage!))
                  : WebView(
                      initialUrl: controller.redirectUrl!,
                      javascriptMode: JavascriptMode.unrestricted,
                      gestureNavigationEnabled: true,
                      debuggingEnabled: true,
                      onWebViewCreated: (webViewController) {
                        controller.setWebViewController(webViewController);
                      },
                      javascriptChannels: <JavascriptChannel>[
                        controller.jsChannel(context),
                      ].toSet(),
                      onPageFinished: (String url) {
                        controller.getMethods.extractAndStoreState(url);
                        controller.webViewController.runJavascript(
                            "document.getElementById('submit').addEventListener('click', function() { bridge.postMessage('submitClicked'); });");
                        auth.dopost();
                      },
                    ),
        );
      },
    );
  }
}
