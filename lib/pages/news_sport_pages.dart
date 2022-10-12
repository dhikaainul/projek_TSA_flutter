import 'package:flutter_news/models/news_respon.dart';
import 'package:flutter_news/service/http_service.dart';
import 'package:flutter_news/views/news_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsSportCategory extends StatelessWidget {
  //variabel bertipe RequestSportCategory di mana isinya terdapat apikey berdasrakan kategori sport
  RequestSportCategory requestSportCategory = RequestSportCategory();
  String newsSport;

  NewsSportCategory({super.key, required this.newsSport}); //konstruktor

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
      ),
      // futurebuilder : untuk menentukan status dari proses yang sedang berjalan
      body: FutureBuilder(
          future: requestSportCategory.getNewsByCategory(newsSport),
          builder: (context, snapshot) {
            //snapshot mendapatkan data maka return ke ListSportNewsCategory
            if (snapshot.hasData) {
              return ListSportNewsCategory(snapshot.data);
            }
            //snapshot mendapatkan error maka return eror dengan menampilkan teks data tidak tersedia
            else if (snapshot.hasError) {
              // ignore: avoid_print
              print(snapshot.error);
              return const Center(child: Text("Data tidak tersedia"));
            }
            //menampilkan loading saat data belum selesai diambil
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

// ignore: must_be_immutable
class ListSportNewsCategory extends StatelessWidget {
  NewsRespon? responseBerita;

  ListSportNewsCategory(this.responseBerita, {super.key}); //konstruktor

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          //ListView.builder : list yang bersifat dinamis
          child: ListView.builder(
              itemCount: responseBerita?.news.length, //jumlah/panjang list item
              shrinkWrap: true, //untuk menentukan hight pada list yang tepat
              physics: const ClampingScrollPhysics(),
              //itemBuilder : bagaimana item ditampilkan
              itemBuilder: (context, index) {
                return NewsItem(
                  imgUrl: responseBerita?.news[index].urlToImage ?? "",
                  title: responseBerita?.news[index].title ?? "",
                  desc: responseBerita?.news[index].description ?? "",
                  content: responseBerita?.news[index].content ?? "",
                  posturl: responseBerita?.news[index].url ?? "",
                  name: responseBerita?.news[index].source.name ?? "",
                );
              }),
        ),
      ),
    );
  }
}
