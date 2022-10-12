class Source {
  //deklarasi variabel pada class Source
  late String id;
  late String name;

  //konversi dari jsonmap ke Source -> mengambil data berbentuk jsonmap yang disimpan ke bentuk variabel
  Source.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"] ?? "",
        name = map["name"];

  //konversi dari Source ke json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
