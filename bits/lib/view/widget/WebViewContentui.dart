import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContent extends StatelessWidget {
  final String? redirectUrl;
  final bool isLoading;
  final String? errorMessage;

  WebViewContent({
    required this.redirectUrl,
    required this.isLoading,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : errorMessage != null
            ? Center(child: Text(errorMessage!))
            : WebView(
                initialUrl: redirectUrl!,
                javascriptMode: JavascriptMode.unrestricted,
              );
  }
}
