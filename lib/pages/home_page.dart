import 'package:flutter_news/pages/halamanutama_page.dart';
import 'package:flutter_news/pages/search.dart';
import 'package:flutter_news/service/http_service.dart';
// import 'package:flutter_news/widget/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpService news = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 50),
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
              ),
            ],
          ),
        ),
        // leading: IconButton(
        //     icon: const Icon(Icons.search, color: Colors.black),
        //     //Menangani kejadian saat menu home diklik
        //     onPressed: () {
        //       Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (BuildContext context) => const Search(),
        //                 ),
        //               );
        //     },
        //   ),
        actions: <Widget>[
          InkWell(
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Search(),
                ),
              );
            },
          ),
          SizedBox(width: 10),
        ],
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),

      // safearea : untuk menyesuaikan widget dengan bentuk layar pada hp
      body: SafeArea(
        // futurebuilder : untuk menentukan status dari proses yang sedang berjalan
        child: FutureBuilder(
          future: news.getNews(),
          builder: (context, snapshot) {
            //snapshot mendapatkan data maka return ke halamanutama
            if (snapshot.hasData) {
              return HalamanUtamaPage(snapshot.data);
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
      ),
    );
  }
}
