import 'BaiHat.dart';

class TheLoai {
  int? id;
  String? tenTheLoai;
  String? linkHinh;
  List<BaiHat>? baiHat;

  TheLoai({this.id, this.tenTheLoai, this.linkHinh, this.baiHat});

  TheLoai.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenTheLoai = json['tenTheLoai'];
    linkHinh = json['linkHinh'];
    if (json['BaiHat'] != null) {
      baiHat = <BaiHat>[];
      json['BaiHat'].forEach((v) {
        baiHat!.add(new BaiHat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenTheLoai'] = this.tenTheLoai;
    data['linkHinh'] = this.linkHinh;
    if (this.baiHat != null) {
      data['BaiHat'] = this.baiHat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}