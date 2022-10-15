import 'BaiHat.dart';

class Album {
  int? id;
  String? tenAlbum;
  String? tenCaSi;
  String? linkHinh;
  List<BaiHat>? listbaihat;

  Album({this.id, this.tenAlbum, this.tenCaSi, this.linkHinh, this.listbaihat});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenAlbum = json['tenAlbum'];
    tenCaSi = json['tenCaSi'];
    linkHinh = json['linkHinh'];
    if (json['listbaihat'] != null) {
      listbaihat = <BaiHat>[];
      json['listbaihat'].forEach((v) {
        listbaihat!.add(new BaiHat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenAlbum'] = this.tenAlbum;
    data['tenCaSi'] = this.tenCaSi;
    data['linkHinh'] = this.linkHinh;
    if (this.listbaihat != null) {
      data['listbaihat'] = this.listbaihat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
