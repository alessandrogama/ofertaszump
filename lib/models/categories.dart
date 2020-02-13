class Category {
  RequestInfo requestInfo;
  Pagination pagination;
  List<Categories> categories;

  Category({this.requestInfo, this.pagination, this.categories});

  Category.fromJson(Map<String, dynamic> json) {
    requestInfo = json['requestInfo'] != null
        ? new RequestInfo.fromJson(json['requestInfo'])
        : null;
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requestInfo != null) {
      data['requestInfo'] = this.requestInfo.toJson();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
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

class Pagination {
  int page;
  int size;
  int totalSize;
  int totalPage;

  Pagination({this.page, this.size, this.totalSize, this.totalPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    size = json['size'];
    totalSize = json['totalSize'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['size'] = this.size;
    data['totalSize'] = this.totalSize;
    data['totalPage'] = this.totalPage;
    return data;
  }
}

class Categories {
  int id;
  String name;
  int hasOffer;
  String link;

  Categories({this.id, this.name, this.hasOffer, this.link});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hasOffer = json['hasOffer'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hasOffer'] = this.hasOffer;
    data['link'] = this.link;
    return data;
  }
}