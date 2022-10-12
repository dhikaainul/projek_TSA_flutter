import 'dart:async'; // Add this import for Completer
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStackKompas extends StatefulWidget {
  const WebViewStackKompas({required this.controller, Key? key})
      : super(key: key); // Modify

  final Completer<WebViewController> controller; // Add this attribute

  @override
  State<WebViewStackKompas> createState() => _WebViewStackKompasState();
}

class _WebViewStackKompasState extends State<WebViewStackKompas> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: 'https://www.kompas.com/',
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
