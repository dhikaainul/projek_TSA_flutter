import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/src/navigation_controls_detik.dart';
import 'package:flutter_news/src/navigation_controls_kompas.dart';
import 'package:flutter_news/src/web_view_stack_detik.dart';
import 'package:flutter_news/src/web_view_stack_kompas.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Add this import back

class Kompas extends StatefulWidget {
  const Kompas({Key? key}) : super(key: key);

  @override
  State<Kompas> createState() => _KompasState();
}

class _KompasState extends State<Kompas> {
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
          NavigationControlsKompas(controller: controller),
        ],
      ),
      body: WebViewStackKompas(
          controller: controller), // Add the controller argument
    );
  }
}
