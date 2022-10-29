import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/pages/data.dart';
import 'package:flutter_news/views/web_news_view.dart';
import 'package:share/share.dart';

class DetailNewsItem extends StatefulWidget {
  final String imgUrl, title, desc, content, posturl, name;
  final index, value;

  //konstruktor
  const DetailNewsItem(
      {super.key,
      required this.imgUrl,
      required this.desc,
      required this.title,
      required this.content,
      required this.name,
      required this.posturl,
      required this.index,
      required this.value});

  @override
  State<DetailNewsItem> createState() => _DetailNewsItemState();
}

class _DetailNewsItemState extends State<DetailNewsItem> {
  final index;
  final value;
  final snackbar = const SnackBar(content: Text("Berita telah Tersimpan"));
  String img =
      "https://smkassaadahgresik.sch.id/wp-content/uploads/2022/08/no.png";
  showimage() {
    // ignore: unnecessary_null_comparison
    if (widget.imgUrl == " ") {
      return img;
    } else {
      return widget.imgUrl;
    }
  }

  _DetailNewsItemState({@required this.index, @required this.value}) : super();

  // proses menyimpan data yang diinput user ke Shared Preferences
  saveData() async {
    // cek semua data sudah diisi atau belum
    // jika belum tampilkan pesan error
    if (index == null) {
      // data yang akan dimasukkan atau diupdate ke Shared Preferences sesuai input user
      var customer = {
        'judul': widget.title,
        'isi': widget.desc,
        'gambar': widget.imgUrl,
        'nama': widget.name,
        'index_berita': index,
        'url': widget.posturl
      };

      // ambil data Shared Preferences sebagai list
      var savedData = await Data.getData();
      savedData.insert(0, customer);

      // // simpan data yang diinsert / diedit user ke Shared Preferences kembali
      // // kemudian tutup halaman insert ini
      await Data.saveData(savedData);
      // Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Empty Field'),
              content: Text('Please fill all field.'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                )
              ],
            );
          });
    }
  }

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
                "Detail",
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
          SizedBox(width: 10),
          InkWell(
            child: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            onTap: () {
              saveData();
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
          ),
          SizedBox(width: 10),
          InkWell(
            child: Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
            onTap: () {
              Share.share(widget.posturl);
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
                    image: NetworkImage(showimage()), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            AutoSizeText(
              widget.title,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              maxLines: 3,
            ),
            SizedBox(
              height: 10,
            ),
            AutoSizeText(
              widget.content,
              style: TextStyle(color: Colors.black54, fontSize: 13),
              maxLines: 5,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 120),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebNews(
                        postUrl: widget.posturl,
                      ),
                    ),
                  );
                },
                child: new Text('Selengkapnya'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}