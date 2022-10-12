import 'package:flutter/material.dart';
import 'package:flutter_news/pages/home_page.dart';
import 'package:flutter_news/pages/splashcreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghapus debug banner
      // backgroundColor: Colors.y
      // theme: ThemeData.dark().copyWith(
      // selectedRowColor: Color.fromARGB(255, 7, 11, 235),
      // primaryColor: const Color.fromARGB(255, 255, 255, 255),
      // scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)
      // ),
      home: const SplashScreenPage(), //memanggil class HomePage
    );
  }
}
