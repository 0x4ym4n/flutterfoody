class Foodobj {
  String tenmon;
  String tenquan;
  String img;
  String gia;
  int rating;

  Foodobj(this.tenmon, this.tenquan, this.img, this.gia, this.rating);

  Foodobj.fromJson(Map<String, dynamic> json) {    
    this.tenmon = json['tenmon'];
    this.tenquan = json['tenquan'];
    this.img = json['img'];
    this.gia = json['gia'];
    this.rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenmon'] = this.tenmon;
    data['tenquan'] = this.tenquan;
    data['img'] = this.img;
    data['gia'] = this.gia;
    data['rating'] = this.rating;
    return data;
  }

}
