import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/src/navigation_controls_cnn.dart';
import 'package:flutter_news/src/navigation_controls_detik.dart';
import 'package:flutter_news/src/web_view_stack_cnn.dart';
import 'package:flutter_news/src/web_view_stack_detik.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Add this import back

class Cnn extends StatefulWidget {
  const Cnn({Key? key}) : super(key: key);

  @override
  State<Cnn> createState() => _CnnState();
}

class _CnnState extends State<Cnn> {
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
                "CNN",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                " Indonesia",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          NavigationControlsCnn(controller: controller),
        ],
      ),
      body: WebViewStackCnn(
          controller: controller), // Add the controller argument
    );
  }
}
