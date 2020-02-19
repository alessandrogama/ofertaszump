class Offer {
  RequestInfo requestInfo;
  Pagination pagination;
  List<Offers> offers;

  Offer({this.requestInfo, this.pagination, this.offers});

  Offer.fromJson(Map<String, dynamic> json) {
    requestInfo = json['requestInfo'] != null
        ? new RequestInfo.fromJson(json['requestInfo'])
        : null;
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['offers'] != null) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
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
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
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

class Offers {
  String id;
  String name;
  Category category;
  String link;
  String thumbnail;
  double price;
  double priceFrom;
  Installment installment;
  Store store;

  Offers(
      {this.id,
      this.name,
      this.category,
      this.link,
      this.thumbnail,
      this.price,
      this.priceFrom,
      this.installment,
      this.store});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    link = json['link'];
    thumbnail = json['thumbnail'];
    price = json['price'];
    priceFrom = json['priceFrom'];
    installment = json['installment'] != null
        ? new Installment.fromJson(json['installment'])
        : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['link'] = this.link;
    data['thumbnail'] = this.thumbnail;
    data['price'] = this.price;
    data['priceFrom'] = this.priceFrom;
    if (this.installment != null) {
      data['installment'] = this.installment.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    return data;
  }
}

class Category {
  int id;
  String name;
  String link;

  Category({this.id, this.name, this.link});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    return data;
  }
}

class Installment {
  int quantity;
  double value;

  Installment({this.quantity, this.value});

  Installment.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['value'] = this.value;
    return data;
  }
}

class Store {
  int id;
  String name;
  String thumbnail;
  String link;

  Store({this.id, this.name, this.thumbnail, this.link});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    data['link'] = this.link;
    return data;
  }
}
