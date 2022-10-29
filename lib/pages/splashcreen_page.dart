import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news/pages/buttom_navi.dart';
import 'package:flutter_news/pages/home_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return const ButtomNavi();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 1, 4, 7), 
      body: Center(
        child: Image.asset(
          "assets/images/pemudanews.png",
          width: 200.0,
          height: 300.0,
        ),
      ),
    );
  }
}
