class ClinicSolo {
  bool? succeeded;
  String? message;
  String? errors;
  ClinicSoloData? data;

  ClinicSolo({this.succeeded, this.message, this.errors, this.data});

  ClinicSolo.fromJson(Map<String, dynamic> json) {
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    data =
        json['data'] != null ? new ClinicSoloData.fromJson(json['data']) : null;
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

class ClinicSoloData {
  String? name;
  double? latitude;
  double? longitude;
  String? regionName;
  String? cityName;
  String? countryName;
  String? countryCode;
  String? address;
  String? phone;
  String? email;
  String? description;
  int? cityId;
  int? regionId;
  int? countryId;
  List<String>? imageUrls;
  int? id;

  ClinicSoloData(
      {this.name,
      this.latitude,
      this.longitude,
      this.regionName,
      this.cityName,
      this.countryName,
      this.countryCode,
      this.address,
      this.phone,
      this.email,
      this.description,
      this.cityId,
      this.regionId,
      this.countryId,
      this.imageUrls,
      this.id});

  ClinicSoloData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    regionName = json['regionName'];
    cityName = json['cityName'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    description = json['description'];
    cityId = json['cityId'];
    regionId = json['regionId'];
    countryId = json['countryId'];
    imageUrls = json['imageUrls'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['regionName'] = this.regionName;
    data['cityName'] = this.cityName;
    data['countryName'] = this.countryName;
    data['countryCode'] = this.countryCode;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['description'] = this.description;
    data['cityId'] = this.cityId;
    data['regionId'] = this.regionId;
    data['countryId'] = this.countryId;
    data['imageUrls'] = this.imageUrls;
    data['id'] = this.id;
    return data;
  }
}
