import 'package:flutter_news/models/news_respon.dart';
import 'package:flutter_news/service/http_service.dart';
import 'package:flutter_news/views/news_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsHealthCategory extends StatelessWidget {
  //variabel bertipe RequestHealthCategory di mana isinya terdapat apikey berdasrakan kategori health
  RequestHealthCategory requestHealthCategory = RequestHealthCategory();
  String newsHealth;

  NewsHealthCategory({super.key, required this.newsHealth}); //konstruktor

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
                "Berita",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                " Kesehatan",
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
        future: requestHealthCategory.getNewsByCategory(newsHealth),
        builder: (context, snapshot) {
          //snapshot mendapatkan data maka return ke ListHealthNewsCategory
          if (snapshot.hasData) {
            return ListHealthNewsCategory(snapshot.data);
          }
          //snapshot mendapatkan error maka return eror dengan menampilkan teks data tidak tersedia
          else if (snapshot.hasError) {
            // ignore: avoid_print
            print(snapshot.error);
            return const Center(child: Text("Data tidak tersedia"));
          }
          //menampilkan loading saat data belum selesai diambil
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ListHealthNewsCategory extends StatelessWidget {
  NewsRespon? responseBerita;

  ListHealthNewsCategory(this.responseBerita, {super.key}); //konstruktor

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
              // icon klik simpan data berita
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
      ),
    );
  }
}
