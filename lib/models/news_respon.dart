// ignore_for_file: unnecessary_null_comparison

import 'news.dart';

class NewsRespon {
  //deklarasi variabel pada class NewsRespon
  String status;
  int totalResults;
  List<News> news;

  //konversi dari jsonmap ke NewsRespom -> mengambil data berbentuk jsonmap yang disimpan ke bentuk variabel
  NewsRespon.fromJsonMap(Map<String, dynamic> map)
      : status = map["status"],
        totalResults = map["totalResults"],
        news =
            List<News>.from(map["articles"].map((it) => News.fromJsonMap(it)));

  //konversi dari NewsRespon ke json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['articles'] =
        // ignore: prefer_null_aware_operators
        news != null ? news.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
