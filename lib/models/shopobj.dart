class Shopobj {
  String diachi;
  String tenquan;


  int rating;

  Shopobj(this.diachi, this.tenquan,this.rating);

  Shopobj.fromJson(Map<String, dynamic> json) {
    this.diachi = json['diachi'];
    this.tenquan = json['tenquan'];


    this.rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diachi'] = this.diachi;
    data['tenquan'] = this.tenquan;


    data['rating'] = this.rating;
    return data;
  }

}
