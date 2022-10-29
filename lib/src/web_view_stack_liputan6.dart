import 'dart:async'; // Add this import for Completer
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStackLiputan6 extends StatefulWidget {
  const WebViewStackLiputan6({required this.controller, Key? key})
      : super(key: key); // Modify

  final Completer<WebViewController> controller; // Add this attribute

  @override
  State<WebViewStackLiputan6> createState() => _WebViewStackLiputan6State();
}

class _WebViewStackLiputan6State extends State<WebViewStackLiputan6> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: 'https://www.liputan6.com/',
          onWebViewCreated: (webViewController) {
            widget.controller.complete(webViewController);
          },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
