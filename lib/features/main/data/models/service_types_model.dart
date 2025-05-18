/// data : [{"categoryId":"1","categoryName":"خدمات مو","services":[{"serviceId":"1","serviceName":"کوتاهی مو"},{"serviceId":"2","serviceName":"رنگ مو"},{"serviceId":"3","serviceName":"کراتینه"},{"serviceId":"4","serviceName":"براشینگ"},{"serviceId":"5","serviceName":"بافت مو"}]},{"categoryId":"2","categoryName":"خدمات ناخن","services":[{"serviceId":"6","serviceName":"مانیکور"},{"serviceId":"7","serviceName":"پدیکور"},{"serviceId":"8","serviceName":"کاشت ناخن"},{"serviceId":"9","serviceName":"ترمیم ناخن"},{"serviceId":"10","serviceName":"طراحی ناخن"}]},{"categoryId":"3","categoryName":"خدمات پوست","services":[{"serviceId":"11","serviceName":"پاکسازی پوست"},{"serviceId":"12","serviceName":"ماساژ صورت"},{"serviceId":"13","serviceName":"لیزر"},{"serviceId":"14","serviceName":"میکرودرم"},{"serviceId":"15","serviceName":"هیدرودرم"}]},{"categoryId":"4","categoryName":"خدمات ابرو","services":[{"serviceId":"16","serviceName":"میکروبلیدینگ ابرو"},{"serviceId":"17","serviceName":"شامپو ابرو"},{"serviceId":"18","serviceName":"قرینه‌سازی ابرو"},{"serviceId":"19","serviceName":"لیفت ابرو"},{"serviceId":"20","serviceName":"ریموو ابرو"}]},{"categoryId":"5","categoryName":"خدمات مژه","services":[{"serviceId":"21","serviceName":"اکستنشن مژه"},{"serviceId":"22","serviceName":"لیفت مژه"},{"serviceId":"23","serviceName":"لمینیت مژه"},{"serviceId":"24","serviceName":"کاشت مژه"},{"serviceId":"25","serviceName":"ریموو مژه"}]}]
/// message : null

class ServiceTypesModel {
  ServiceTypesModel({
      this.data, 
      this.message,});

  ServiceTypesModel.fromJson(dynamic json) {
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

/// categoryId : "1"
/// categoryName : "خدمات مو"
/// services : [{"serviceId":"1","serviceName":"کوتاهی مو"},{"serviceId":"2","serviceName":"رنگ مو"},{"serviceId":"3","serviceName":"کراتینه"},{"serviceId":"4","serviceName":"براشینگ"},{"serviceId":"5","serviceName":"بافت مو"}]

class Data {
  Data({
      this.categoryId, 
      this.categoryName, 
      this.services,});

  Data.fromJson(dynamic json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    if (json['services'] != null) {
      services = [];
      json['services'].forEach((v) {
        services?.add(Services.fromJson(v));
      });
    }
  }
  String? categoryId;
  String? categoryName;
  List<Services>? services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = categoryId;
    map['categoryName'] = categoryName;
    if (services != null) {
      map['services'] = services?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// serviceId : "1"
/// serviceName : "کوتاهی مو"

class Services {
  Services({
      this.serviceId, 
      this.serviceName,});

  Services.fromJson(dynamic json) {
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
  }
  String? serviceId;
  String? serviceName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['serviceId'] = serviceId;
    map['serviceName'] = serviceName;
    return map;
  }

}