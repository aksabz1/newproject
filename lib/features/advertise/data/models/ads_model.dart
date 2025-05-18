/// data : [{"id":5,"title":null,"category":{"id":1,"name":"خدمات مو"},"subcategories":[],"prices":[],"hasSalon":true,"salonName":null,"salonPhone":null,"salonAddress":null,"description":null}]
/// message : null

class AdsModel {
  AdsModel({
      this.data, 
      this.message,});

  AdsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }
  List<Data>? data;
  dynamic message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

/// id : 5
/// title : null
/// category : {"id":1,"name":"خدمات مو"}
/// subcategories : []
/// prices : []
/// hasSalon : true
/// salonName : null
/// salonPhone : null
/// salonAddress : null
/// description : null

class Data {
  Data({
      this.id, 
      this.title, 
      this.category, 
      this.subcategories, 
      this.prices, 
      this.hasSalon, 
      this.salonName, 
      this.salonPhone, 
      this.salonAddress, 
      this.description,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['subcategories'] != null) {
      subcategories = [];
      json['subcategories'].forEach((v) {
        // subcategories?.add(Dynamic.fromJson(v));
      });
    }
    if (json['prices'] != null) {
      prices = [];
      json['prices'].forEach((v) {
        // prices?.add(Dynamic.fromJson(v));
      });
    }
    hasSalon = json['hasSalon'];
    salonName = json['salonName'];
    salonPhone = json['salonPhone'];
    salonAddress = json['salonAddress'];
    description = json['description'];
  }
  int? id;
  dynamic title;
  Category? category;
  List<dynamic>? subcategories;
  List<dynamic>? prices;
  bool? hasSalon;
  String? salonName;
  dynamic salonPhone;
  dynamic salonAddress;
  dynamic description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (subcategories != null) {
      map['subcategories'] = subcategories?.map((v) => v.toJson()).toList();
    }
    if (prices != null) {
      map['prices'] = prices?.map((v) => v.toJson()).toList();
    }
    map['hasSalon'] = hasSalon;
    map['salonName'] = salonName;
    map['salonPhone'] = salonPhone;
    map['salonAddress'] = salonAddress;
    map['description'] = description;
    return map;
  }

}

/// id : 1
/// name : "خدمات مو"

class Category {
  Category({
      this.id, 
      this.name,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}