import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/views/web_news_view.dart';
import 'data.dart';

class Detail extends StatefulWidget {
  final index;
  final judul;
  final isi;
  final gambar;
  final url;
  Detail(
      {Key? key,
      @required this.index,
      @required this.judul,
      @required this.isi,
      @required this.gambar,
      @required this.url})
      : super(key: key);

  @override
  _DetailState createState() => _DetailState(
      index: index, judul: judul, isi: isi, gambar: gambar, url: url);
}

class _DetailState extends State<Detail> {
  _DetailState(
      {@required this.index,
      @required this.judul,
      @required this.isi,
      @required this.url,
      @required this.gambar})
      : super();
  // variabel untuk menampung data yang dikirim dari halaman home
  final index;
  final judul;
  final isi;
  final gambar;
  final url;
  final snackbar = const SnackBar(content: Text("Berita telah Terhapus"));

  // cek semua data sudah diisi atau belum
  isDataValid() {
    if (judul.text.isEmpty) {
      return false;
    }

    if (isi.text.isEmpty) {
      return false;
    }

    if (gambar.text.isEmpty) {
      return false;
    }

    if (url.text.isEmpty) {
      return false;
    }

    return true;
  }

  getData() {
    // jika nilai index dan value yang dikirim dari halaman home tidak null
    // artinya ini adalah operasi update
    // tampilkan data yang dikirim, sehingga user bisa edit
    if (index != null && judul != null) {
      setState(() {
        judul;
        isi;
        gambar;
        url;
      });
    }
  }

  // proses menyimpan data yang diinput user ke Shared Preferences
  deleteData() async {
    // ambil data Shared Preferences sebagai list
    // delete data pada index yang sesuai
    // kemudian simpan kembali ke Shared Preferences
    // dan kembali ke halaman Home
    var savedData = await Data.getData();
    savedData.removeAt(index);

    await Data.saveData(savedData);

    Navigator.pop(context);
  }

  getDeleteButton() {
    // jika proses update tampilkan tombol delete
    // jika insert return widget kosong
    if (index != null && judul != null) {
      return ElevatedButton(
        child:
            // Text(
            //   'DELETE',
            //   style: TextStyle(color: Colors.white),
            // ),
            Icon(
          Icons.delete,
          color: Colors.black,
        ),
        onPressed: () {
          deleteData();
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, //mengatur posisi widget di dalam row agar terletak di tengah
              children: const <Widget>[
                Text(
                  "Pemuda",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Text(
                  " News",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            getDeleteButton(),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                      image: NetworkImage(gambar == " "
                          ? "https://smkassaadahgresik.sch.id/wp-content/uploads/2022/08/no.png"
                          : gambar),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              AutoSizeText(
                judul,
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
                isi,
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
                          postUrl: url,
                        ),
                      ),
                    );
                  },
                  child: new Text('Selengkapnya'),
                ),
              ),
            ],
          ),
        ));
  }
}
