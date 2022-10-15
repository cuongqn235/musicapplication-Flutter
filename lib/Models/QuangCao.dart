import 'BaiHat.dart';

class QuangCao {
  int? id;
  String? linkHinh;
  String? noiDungQuangCao;
  BaiHat? baihat;

  QuangCao({this.id, this.linkHinh, this.noiDungQuangCao, this.baihat});

  QuangCao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    linkHinh = json['linkHinh'];
    noiDungQuangCao = json['noiDungQuangCao'];
    baihat =
    json['baihat'] != null ? new BaiHat.fromJson(json['baihat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['linkHinh'] = this.linkHinh;
    data['noiDungQuangCao'] = this.noiDungQuangCao;
    if (this.baihat != null) {
      data['baihat'] = this.baihat!.toJson();
    }
    return data;
  }
}