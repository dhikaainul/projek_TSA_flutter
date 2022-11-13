import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/src/navigation_controls_detik.dart';
import 'package:flutter_news/src/web_view_stack_detik.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Add this import back

class Detik extends StatefulWidget {
  const Detik({Key? key}) : super(key: key);

  @override
  State<Detik> createState() => _DetikState();
}

class _DetikState extends State<Detik> {
  final controller =
      Completer<WebViewController>(); // Instantiate the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .center, //mengatur posisi widget di dalam row agar terletak di tengah
            children: const <Widget>[
              Text(
                "Detik",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                " News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          NavigationControlsDetik(controller: controller),
        ],
      ),
      body: WebViewStackDetik(
          controller: controller), // Add the controller argument
    );
  }
}
