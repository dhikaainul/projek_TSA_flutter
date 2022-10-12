import 'package:flutter/material.dart';
import 'package:flutter_news/views/detail_news_item.dart';
import 'web_news_view.dart';

class NewsItem extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, name;

  //konstruktor
  const NewsItem(
      {super.key,
      required this.imgUrl,
      required this.desc,
      required this.title,
      required this.content,
      required this.name,
      required this.posturl});
  //item berita bisa diklik dengan menggunakan gesture detectore ke hal web beritanya
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
                imgUrl: imgUrl,
                desc: desc,
                title: title,
                content: content,
                name: name,
                posturl: posturl),
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
                      imgUrl,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
