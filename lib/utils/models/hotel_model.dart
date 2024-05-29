class HotelModel {
  bool? succeeded;
  String? message;
  String? errors;
  Data? data;

  HotelModel({this.succeeded, this.message, this.errors, this.data});

  HotelModel.fromJson(Map<String, dynamic> json) {
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalCount;
  List<HotelModelItems>? items;

  Data({this.totalCount, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <HotelModelItems>[];
      json['items'].forEach((v) {
        items!.add(new HotelModelItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotelModelItems {
  String? name;
  String? star;
  String? address;
  double? latitude;
  double? longitude;
  String? description;
  String? cityName;
  String? regionName;
  String? countryCode;
  String? countryName;
  String? phone;
  String? email;
  int? id;
  List<String>? imageUrls;

  HotelModelItems(
      {this.name,
      this.star,
      this.address,
      this.latitude,
      this.description,
      this.longitude,
      this.cityName,
      this.regionName,
      this.countryCode,
      this.countryName,
      this.phone,
      this.email,
      this.id,
      this.imageUrls});

  HotelModelItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    star = json['star']?.toString();
    address = json['address'];
    latitude = (json['latitude'] as num?)?.toDouble();
    longitude = (json['longitude'] as num?)?.toDouble();
    cityName = json['cityName'];
    regionName = json['regionName'];
    countryCode = json['countryCode'];
    description = json['description']?.toString();
    countryName = json['countryName'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    if (json['imageUrls'] != null) {
      imageUrls = List<String>.from(json['imageUrls']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['star'] = this.star;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['description'] = this.description;
    data['longitude'] = this.longitude;
    data['cityName'] = this.cityName;
    data['regionName'] = this.regionName;
    data['countryCode'] = this.countryCode;
    data['countryName'] = this.countryName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['id'] = this.id;
    if (this.imageUrls != null) {
      data['imageUrls'] = this.imageUrls;
    }
    return data;
  }
}
