import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/src/navigation_controls_detik.dart';
import 'package:flutter_news/src/navigation_controls_liputan6.dart';
import 'package:flutter_news/src/navigation_controls_tribun.dart';
import 'package:flutter_news/src/web_view_stack_detik.dart';
import 'package:flutter_news/src/web_view_stack_liputan6.dart';
import 'package:flutter_news/src/web_view_stack_tribun.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Add this import back

class Liputan6 extends StatefulWidget {
  const Liputan6({Key? key}) : super(key: key);

  @override
  State<Liputan6> createState() => _Liputan6State();
}

class _Liputan6State extends State<Liputan6> {
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
                "Pemuda",
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
          NavigationControlsLiputan6(controller: controller),
        ],
      ),
      body: WebViewStackLiputan6(
          controller: controller), // Add the controller argument
    );
  }
}
