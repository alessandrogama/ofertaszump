class Coupon {
  RequestInfo requestInfo;
  List<Stores> stores;

  Coupon({this.requestInfo, this.stores});

  Coupon.fromJson(Map<String, dynamic> json) {
    requestInfo = json['requestInfo'] != null
        ? new RequestInfo.fromJson(json['requestInfo'])
        : null;
    if (json['stores'] != null) {
      stores = new List<Stores>();
      json['stores'].forEach((v) {
        stores.add(new Stores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requestInfo != null) {
      data['requestInfo'] = this.requestInfo.toJson();
    }
    if (this.stores != null) {
      data['stores'] = this.stores.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequestInfo {
  String status;
  String message;
  Null generatedDate;

  RequestInfo({this.status, this.message, this.generatedDate});

  RequestInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    generatedDate = json['generatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['generatedDate'] = this.generatedDate;
    return data;
  }
}

class Stores {
  int id;
  String name;
  String image;
  String link;

  Stores({this.id, this.name, this.image, this.link});

  Stores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['link'] = this.link;
    return data;
  }
}