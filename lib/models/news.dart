import 'package:flutter_news/models/source.dart';

class News {
  //deklarasi variabel pada class News
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  //konversi dari News jsonmap ke struktur map -> mengambil data berbentuk jsonmap yang disimpan ke bentuk variabel
  // Konstruktor Source.fromJson(), untuk membuat Source instance baru dari struktur peta.
  News.fromJsonMap(Map<String, dynamic> map)
      : source = Source.fromJsonMap(map["source"]),
        author = map["author"] ?? "",
        title = map["title"] ?? "",
        description = map["description"] ?? "",
        url = map["url"] ?? "",
        urlToImage = map["urlToImage"] ?? " ",
        publishedAt = map["publishedAt"] ?? "",
        content = map["content"] ?? "";

  //konversi dari Map ke json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    //untuk memastikan apakah data pada class Source bernilai null atau tidak
    //Memasukkan data 
    // metode, yang mengubah sebuah Source instance menjadi sebuah peta.
    // ignore: prefer_null_aware_operators, unnecessary_null_comparison
    data['source'] = source == null ? null : source.toJson();

    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}
