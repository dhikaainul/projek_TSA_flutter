import 'package:flutter/material.dart';
import 'package:flutter_news/pages/berita.dart';
import 'package:flutter_news/pages/home_page.dart';
import 'package:flutter_news/pages/news_business_pages.dart';
import 'package:flutter_news/pages/news_health_pages.dart';

class ButtomNavi extends StatefulWidget {
  const ButtomNavi({super.key});

  @override
  State<ButtomNavi> createState() => _ButtomNaviState();
}

class _ButtomNaviState extends State<ButtomNavi> {
  int currentIndex = 0;
  final List<Widget> body = [HomePage(), Berita(), Berita()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper_outlined,
              color: Colors.grey,
            ),
            label: 'News',
            activeIcon: Icon(
              Icons.newspaper_outlined,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box_outlined,
              color: Colors.grey,
            ),
            label: 'Profil',
            activeIcon: Icon(
              Icons.account_box_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
