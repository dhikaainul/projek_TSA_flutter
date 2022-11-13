import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/src/navigation_controls_detik.dart';
import 'package:flutter_news/src/navigation_controls_jawapos.dart';
import 'package:flutter_news/src/navigation_controls_tribun.dart';
import 'package:flutter_news/src/web_view_stack_detik.dart';
import 'package:flutter_news/src/web_view_stack_jawapos.dart';
import 'package:flutter_news/src/web_view_stack_tribun.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Add this import back

class JawaPos extends StatefulWidget {
  const JawaPos({Key? key}) : super(key: key);

  @override
  State<JawaPos> createState() => _JawaPosState();
}

class _JawaPosState extends State<JawaPos> {
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
                "Jawa",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                " Pos",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          NavigationControlsJawaPos(controller: controller),
        ],
      ),
      body: WebViewStackJawaPos(
          controller: controller), // Add the controller argument
    );
  }
}
