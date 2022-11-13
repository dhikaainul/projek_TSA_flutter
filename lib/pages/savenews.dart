import 'package:flutter/material.dart';
import 'package:flutter_news/pages/detail.dart';
import 'data.dart';

class SaveNews extends StatefulWidget {
  SaveNews({Key? key}) : super(key: key);

  @override
  _SaveNewsState createState() => _SaveNewsState();
}

class _SaveNewsState extends State<SaveNews> {
  // data customer yang akan ditampilkan di list view
  // beri nilai awal berupa list kosong agar tidak error
  // nantinya akan diisi data dari Shared Preferences
  var savedData = [];

  // method untuk mengambil data Shared Preferences
  getSavedData() async {
    var data = await Data.getData();
    // setelah data didapat panggil setState agar data segera dirender
    setState(() {
      savedData = data;
    });
  }

  // init state ini dipanggil pertama kali oleh flutter
  @override
  initState() {
    super.initState();
    // baca Shared Preferences
    getSavedData();
  }

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
                "Saved",
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
      body: ListView.builder(
        itemCount: savedData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: savedData[index]['gambar'] == " "
                  ? Image.network(
                      "https://smkassaadahgresik.sch.id/wp-content/uploads/2022/08/no.png",
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      savedData[index]['gambar'],
                      width: 100,
                      fit: BoxFit.cover,
                    ),
            ),
            title: Text(
              '${savedData[index]['judul']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${savedData[index]['isi']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: FittedBox(
              fit: BoxFit.fill,
              child: Row(
                children: [
                  // button hapus
                  IconButton(
                    icon: Icon(Icons.newspaper_outlined),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detail(
                                    index: index,
                                    judul: savedData[index]['judul'],
                                    isi: savedData[index]['isi'],
                                    gambar: savedData[index]['gambar'],
                                    url: savedData[index]['url'],
                                  ))).then((value) {
                        // jika halaman insert ditutup ambil kembali Shared Preferences
                        // untuk mendapatkan data terbaru dan segera ditampilkan ke user
                        // misal jika ada data customer yang diedit atau dihapus
                        getSavedData();
                      });
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
