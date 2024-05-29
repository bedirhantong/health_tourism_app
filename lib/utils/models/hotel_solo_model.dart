class HotelSolo {
  bool? succeeded;
  String? message;
  String? errors;
  HotelSoloData? data;

  HotelSolo({this.succeeded, this.message, this.errors, this.data});

  HotelSolo.fromJson(Map<String, dynamic> json) {
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    data =
        json['data'] != null ? new HotelSoloData.fromJson(json['data']) : null;
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

class HotelSoloData {
  String? name;
  String? star;
  String? address;
  String? description;
  double? latitude;
  double? longitude;
  String? cityName;
  String? regionName;
  String? countryCode;
  String? countryName;
  String? phone;
  String? email;
  int? cityId;
  int? regionId;
  int? countryId;
  List<String>? imageUrls;
  int? id;

  HotelSoloData(
      {this.name,
      this.star,
      this.address,
      this.description,
      this.latitude,
      this.longitude,
      this.cityName,
      this.regionName,
      this.countryCode,
      this.countryName,
      this.phone,
      this.email,
      this.cityId,
      this.regionId,
      this.countryId,
      this.imageUrls,
      this.id});

  HotelSoloData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    star = json['star'];
    address = json['address'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cityName = json['cityName'];
    regionName = json['regionName'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    phone = json['phone'];
    email = json['email'];
    cityId = json['cityId'];
    regionId = json['regionId'];
    countryId = json['countryId'];
    imageUrls = json['imageUrls'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['star'] = this.star;
    data['address'] = this.address;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['cityName'] = this.cityName;
    data['regionName'] = this.regionName;
    data['countryCode'] = this.countryCode;
    data['countryName'] = this.countryName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['cityId'] = this.cityId;
    data['regionId'] = this.regionId;
    data['countryId'] = this.countryId;
    data['imageUrls'] = this.imageUrls;
    data['id'] = this.id;
    return data;
  }
}
