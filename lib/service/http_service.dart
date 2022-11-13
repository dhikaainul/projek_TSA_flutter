import 'dart:convert';
import 'package:flutter_news/models/news_respon.dart';
import 'package:http/http.dart' as http;

String apiKey = "42682bd9eb9e4fb2a963a5f6ec924d69"; //deklarasi apikey

class HttpSearching {
  Future<NewsRespon> getNews() async {
    final String url =
        "https://newsapi.org/v2/everything?domains=detik.com,cnnindonesia.com,suara.com,tribunnews.com,liputan6.com&sortBy=publishedAt&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}

//mengambil respon dari server newsapi
class HttpService {
  Future<NewsRespon> getNews() async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=id&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}

//mengambil respon dari server newsapi berdasarkan kategori business
class RequestBusinessCategory {
  Future<NewsRespon> getNewsByCategory(String category) async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}

//mengambil respon dari server newsapi berdasarkan kategori health
class RequestHealthCategory {
  Future<NewsRespon> getNewsByCategory(String category) async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}

//mengambil respon dari server newsapi berdasarkan kategori sport
class RequestSportCategory {
  Future<NewsRespon> getNewsByCategory(String category) async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=id&category=sport&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}

//mengambil respon dari server newsapi berdasarkan kategori science
class RequestScienceCategory {
  Future<NewsRespon> getNewsByCategory(String category) async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=id&category=science&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}

//mengambil respon dari server newsapi berdasarkan kategori entertainment
class RequestEntertainmentCategory {
  Future<NewsRespon> getNewsByCategory(String category) async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=id&category=entertainment&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}

//mengambil respon dari server newsapi berdasarkan kategori general
class RequestGeneralCategory {
  Future<NewsRespon> getNewsByCategory(String category) async {
    final String url =
        "https://newsapi.org/v2/top-headlines?country=id&category=general&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}
