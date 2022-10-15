class BaiHat {
  int? id;
  String? tenBaiHat;
  String? linkHinh;
  String? tenCasi;
  String? linkBaiHat;

  BaiHat(
      {this.id, this.tenBaiHat, this.linkHinh, this.tenCasi, this.linkBaiHat});

  BaiHat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenBaiHat = json['tenBaiHat'];
    linkHinh = json['linkHinh'];
    tenCasi = json['tenCasi'];
    linkBaiHat = json['linkBaiHat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenBaiHat'] = this.tenBaiHat;
    data['linkHinh'] = this.linkHinh;
    data['tenCasi'] = this.tenCasi;
    data['linkBaiHat'] = this.linkBaiHat;
    return data;
  }
}