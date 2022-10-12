import 'package:flutter/material.dart';
import 'package:flutter_news/views/web_news_view.dart';
import 'package:share/share.dart';

class DetailNewsItem extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, name;

  //konstruktor
  const DetailNewsItem(
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
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 20),
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
        // backgroundColor: Colors.blue,
        actions: <Widget>[
          InkWell(
            child: Icon(
              Icons.public,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebNews(
                    postUrl: posturl,
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 10),
          InkWell(
            child: Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
            onTap: () {
              Share.share(posturl);
            },
          ),
          SizedBox(width: 10),
        ],
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                //let's add the height

                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            // InkWell(
            //   child: Icon(
            //     Icons.public,
            //     color: Colors.black,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => WebNews(
            //           postUrl: posturl,
            //         ),
            //       ),
            //     );
            //   },
            // ),
            // InkWell(
            //   child: Icon(
            //     Icons.public,
            //     color: Colors.black,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => WebNews(
            //           postUrl: posturl,
            //         ),
            //       ),
            //     );
            //   },
            // ),
            SizedBox(
              height: 12,
            ),
            Text(
              title,
              maxLines: 4,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              content,
              maxLines: 5,
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),
            //   InkWell(
            //     child: Icon(
            //       Icons.public,
            //       color: Colors.black,
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => WebNews(
            //             postUrl: posturl,
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
