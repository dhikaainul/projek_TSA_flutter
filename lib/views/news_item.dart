import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/views/detail_news_item.dart';
import 'web_news_view.dart';

class NewsItem extends StatefulWidget {
  // Menambahkan variable untuk menyimpan data yang dikirim
  final String imgUrl, title, desc, content, posturl, name;

  //konstruktor dideklarasikan dan dipanggil sesuai dengan variabel key, imgUrl, desc, title, content, name, posturl untuk disimpan data tersebut
  const NewsItem(
      {super.key,
      required this.imgUrl,
      required this.desc,
      required this.title,
      required this.content,
      required this.name,
      required this.posturl});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  String img =
      "https://smkassaadahgresik.sch.id/wp-content/uploads/2022/08/no.png";
  showwidget() {
    // ignore: unnecessary_null_comparison
    if (widget.imgUrl == " ") {
      return img;
    } else {
      return widget.imgUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // builder: (context) => WebNews(
            //   postUrl: posturl,
            builder: (context) => DetailNewsItem(
                imgUrl: widget.imgUrl,
                desc: widget.desc,
                title: widget.title,
                content: widget.content,
                name: widget.name,
                posturl: widget.posturl,
                index: null,
                value: null),
          ),
        );
      },
      //membua tampilan ui per item berita
      child: Container(
        child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      showwidget(),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // Text(
                  //   title,
                  //   maxLines: 3,
                  //   style: TextStyle(
                  //       color: Colors.black87,
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w500),
                  // ),
                  AutoSizeText(
                    widget.title,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  // Text(
                  //   desc,
                  //   maxLines: 2,
                  //   style: TextStyle(color: Colors.black54, fontSize: 13),
                  // )
                  AutoSizeText(
                    widget.desc,
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
