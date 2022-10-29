import 'package:flutter_news/models/news_respon.dart';
import 'package:flutter_news/views/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/service/http_service.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int? newsCount;
  NewsRespon? news;
  List search = [];
  HttpService? service;
  // ignore: prefer_typing_uninitialized_variables
  // var myValue;

  Future initialize() async {
    //news = [];
    news = await service?.getNews();
    setState(() {
      newsCount = news?.news.length;
      news = news;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  // ignore: unnecessary_new
  TextEditingController controller = new TextEditingController();
  onSearch(String text) async {
    search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    // ignore: avoid_function_literals_in_foreach_calls
    news?.news.forEach((i) {
      if (i.title.toLowerCase().contains(text.toLowerCase()) ||
          i.description.contains(text)) search.add(i);
    });
    setState(() {});
  }

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
                "Search",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Text(
                " News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 330,
              // child: search != 0 || controller.text.isNotEmpty
              child: ListView.builder(
                itemCount: search.length,
                // ignore: unnecessary_null_comparison
                // (search.length == null) ? 0 : search.length,
                itemBuilder: (context, index) {
                  return NewsItem(
                    imgUrl: search[index].urlToImage ?? "",
                    title: search[index].title ?? "",
                    desc: search[index].description ?? "",
                    content: search[index].content ?? "",
                    posturl: search[index].url ?? "",
                    name: search[index].source.name ?? "",
                  );
                },
              ),
              // : ListView.builder(
              //     // ignore: unnecessary_null_comparison
              //     itemCount: (newsCount == null) ? 0 : newsCount,
              //     itemBuilder: (context, index) {
              //       return const Center(
              //         child: Text(""),
              //       );
              //     },
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
