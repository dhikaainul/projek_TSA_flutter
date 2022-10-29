import 'dart:async';
// import 'package:flutter_news/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebNews extends StatefulWidget {
  final String postUrl; //mendefinisikan url
  const WebNews({super.key, required this.postUrl}); //konstruktor

  @override
  // ignore: library_private_types_in_public_api
  _WebNewsState createState() => _WebNewsState();
}

class _WebNewsState extends State<WebNews> {
  //controller untuk mengakses url
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .center, //mengatur posisi widget di dalam row agar terletak di tengah
            children: const <Widget>[
              Text(
                "Web",
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, //height yang responsive
        width: MediaQuery.of(context).size.width, //width yang responsive
        //menampilkan halaman website
        child: WebView(
          initialUrl: widget.postUrl, //membaca url
          //menampilkan
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
