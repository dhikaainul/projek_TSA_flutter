import 'package:flutter/material.dart';
import 'package:flutter_news/pages/halamanJawaPos.dart';
import 'package:flutter_news/pages/halamanTribun.dart';
import 'package:flutter_news/pages/halamancnn.dart';
import 'package:flutter_news/pages/halamandetik.dart';
import 'package:flutter_news/pages/halamankompas.dart';

import 'halamanLiputan6.dart';
// import 'package:flutter_news/pages/home_page.dart';

class Berita extends StatelessWidget {
  const Berita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          // padding: EdgeInsets.only(right: 50),
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
      //backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //tombol navigator push ke Mandala()
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Detik()),
                    );
                  },
                  //tampilan card gambar bioskop mandala dan keterangannya
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 228,
                        child: Card(
                          elevation: 10,
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.7,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4)),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/detik.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //tombol navigator push ke Mandala()
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Cnn()),
                    );
                  },
                  //tampilan card gambar bioskop mandala dan keterangannya
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 228,
                        child: Card(
                          elevation: 10,
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.7,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4)),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/cnn.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //tombol navigator push ke Mandala()
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Tribun()),
                    );
                  },
                  //tampilan card gambar bioskop mandala dan keterangannya
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 228,
                        child: Card(
                          elevation: 10,
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.7,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4)),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/tribun2.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //tombol navigator push ke Mandala()
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Kompas()),
                    );
                  },
                  //tampilan card gambar bioskop mandala dan keterangannya
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 228,
                        child: Card(
                          elevation: 10,
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.7,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4)),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/kompas.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //tombol navigator push ke Mandala()
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => JawaPos()),
                    );
                  },
                  //tampilan card gambar bioskop mandala dan keterangannya
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 228,
                        child: Card(
                          elevation: 10,
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.7,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4)),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/jawapos.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //tombol navigator push ke Mandala()
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Liputan6()),
                    );
                  },
                  //tampilan card gambar bioskop mandala dan keterangannya
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 228,
                        child: Card(
                          elevation: 10,
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.7,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4)),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/liputan6.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
