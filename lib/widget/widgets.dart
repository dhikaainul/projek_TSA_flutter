import 'package:flutter/material.dart';

Widget myAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment
          .center, //mengatur posisi widget di dalam row agar terletak di tengah
      children: const <Widget>[
        Text(
          "Pemuda",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          " News",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  );
}
