import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClinicModel {
  bool? succeeded;
  String? message;
  String? errors;
  Data? data;

  ClinicModel({this.succeeded, this.message, this.errors, this.data});

  ClinicModel.fromJson(Map<String, dynamic> json) {
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
  List<ClinicModelItems>? items;

  Data({this.totalCount, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <ClinicModelItems>[];
      json['items'].forEach((v) {
        items!.add(new ClinicModelItems.fromJson(v));
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

class ClinicModelItems {
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
  int? id;
  List<String>? imageUrls;

  ClinicModelItems(
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
      this.id,
      this.imageUrls});

  ClinicModelItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latitude = (json['latitude'] as num?)?.toDouble();
    longitude = (json['longitude'] as num?)?.toDouble();
    regionName = json['regionName'];
    cityName = json['cityName'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    description = json['description'];
    id = json['id'];
    if (json['imageUrls'] != null) {
      imageUrls = List<String>.from(json['imageUrls']);
    }
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
    data['id'] = this.id;
    if (this.imageUrls != null) {
      data['imageUrls'] = this.imageUrls;
    }
    return data;
  }

  Marker toMarker() {
    return Marker(
      markerId: MarkerId(name!),
      position: LatLng(latitude!, longitude!),
      infoWindow: InfoWindow(
        title: name!,
        snippet: address!,
      ),
    );
  }
}
