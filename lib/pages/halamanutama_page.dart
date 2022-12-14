import 'package:flutter_news/models/news_respon.dart';
//import 'package:aplikasi_berita/pages/home_page.dart';
import 'package:flutter_news/pages/news_business_pages.dart';
import 'package:flutter_news/pages/news_entertainment_page.dart';
import 'package:flutter_news/pages/news_health_pages.dart';
import 'package:flutter_news/pages/news_science_pages.dart';
import 'package:flutter_news/pages/news_sport_pages.dart';
import 'package:flutter_news/pages/news_general_pages.dart';
import 'package:flutter_news/views/news_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HalamanUtamaPage extends StatelessWidget {
  //konstruktor
  NewsRespon? responseBerita;
  HalamanUtamaPage(this.responseBerita, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //menu per kategori
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Memanggil class NewsHealthCategory dengan parameter variabel newshealth
                          builder: (BuildContext context) => NewsHealthCategory(
                            newsHealth: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 14),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset('assets/images/Kesehatan.jpg',
                                width: 120, height: 60, fit: BoxFit.cover),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black26),
                            child: const Text(
                              "Kesehatan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Memanggil class NewsEntertainmentCategory dengan parameter variabel newsEntertainment
                          builder: (BuildContext context) =>
                              NewsEntertainmentCategory(
                            newsEntertainment: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 14),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset('assets/images/Hiburan.jpg',
                                width: 120, height: 60, fit: BoxFit.cover),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black26),
                            child: const Text(
                              "Hiburan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Memanggil class NewsBusinessCategory dengan parameter variabel newsBusiness
                          builder: (BuildContext context) =>
                              NewsBusinessCategory(
                            newsBusiness: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 14),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset('assets/images/Business.jpg',
                                width: 120, height: 60, fit: BoxFit.cover),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black26),
                            child: const Text(
                              "Bisnis",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Memanggil class NewsGeneralCategory dengan parameter variabel newsGeneral
                          builder: (BuildContext context) =>
                              NewsGeneralCategory(
                            newsGeneral: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 14),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset('assets/images/Umum.jpg',
                                width: 120, height: 60, fit: BoxFit.cover),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black26),
                            child: const Text(
                              "Umum",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            //Memanggil class NewsScienceCategory dengan parameter variabel newsScience
                            builder: (BuildContext context) =>
                                NewsScienceCategory(
                                  newsScience: '',
                                )),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 14),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset('assets/images/Teknologi.jpg',
                                width: 120, height: 60, fit: BoxFit.cover),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black26),
                            child: const Text(
                              "Teknologi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Memanggil class NewsSportCategory dengan parameter variabel newsSport
                          builder: (BuildContext context) => NewsSportCategory(
                            newsSport: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 14),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset('assets/images/Olahraga.png',
                                width: 120, height: 60, fit: BoxFit.cover),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black26),
                            child: const Text(
                              "Olahraga",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(right: 210, top: 5),
                child: const Text(
                  "Top Headline News",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )),
            //menampilkan news top headline
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: ListView.builder(
                //memanggil variabel responseBerita dengan type NewsRespon dengan panjang sesuai news yang ada di News Respon
                itemCount: responseBerita?.news.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  //Dikembalikan ke class NewsItem dengan variabel yang dipanggil sesuai responseBerita
                  return NewsItem(
                    imgUrl: responseBerita?.news[index].urlToImage ?? "",
                    title: responseBerita?.news[index].title ?? "",
                    desc: responseBerita?.news[index].description ?? "",
                    content: responseBerita?.news[index].content ?? "",
                    posturl: responseBerita?.news[index].url ?? "",
                    name: responseBerita?.news[index].source.name ?? "",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
