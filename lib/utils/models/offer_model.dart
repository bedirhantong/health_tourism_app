import 'agency_model.dart';
import 'clinic_model.dart';
import 'hotel_model.dart';

class OfferModel {
  bool? succeeded;
  String? message;
  String? errors;
  Data? data;

  OfferModel({this.succeeded, this.message, this.errors, this.data});

  OfferModel.fromJson(Map<String, dynamic> json) {
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['succeeded'] = succeeded;
    data['message'] = message;
    data['errors'] = errors;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalCount;
  List<OfferModelItems>? items;

  Data({this.totalCount, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(OfferModelItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalCount'] = totalCount;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OfferModelItems {
  HotelModelItems? hotel;
  ClinicModelItems? clinic;
  AgencyItemsModel? agency;
  String? treatment;
  String? startDate;
  String? endDate;
  bool? isActive;
  String? title;
  String? description;
  double? price;
  double? discount;
  String? currency;
  List<String>? images;
  String? id;

  OfferModelItems({
    this.hotel,
    this.clinic,
    this.agency,
    this.treatment,
    this.startDate,
    this.endDate,
    this.isActive,
    this.title,
    this.description,
    this.price,
    this.discount,
    this.currency,
    this.images,
    this.id,
  });

  OfferModelItems.fromJson(Map<String, dynamic> json) {
    hotel =
        json['hotel'] != null ? HotelModelItems.fromJson(json['hotel']) : null;
    clinic = json['clinic'] != null
        ? ClinicModelItems.fromJson(json['clinic'])
        : null;
    agency = json['agency'] != null
        ? AgencyItemsModel.fromJson(json['agency'])
        : null;
    treatment = json['treatment'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isActive = json['isActive'];
    title = json['title'];
    description = json['description'];
    price = json['price']?.toDouble();
    discount = json['discount']?.toDouble();
    currency = json['currency'];
    images = json['images'] != null ? List<String>.from(json['images']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (hotel != null) {
      data['hotel'] = hotel!.toJson();
    }
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    if (agency != null) {
      data['agency'] = agency!.toJson();
    }
    data['treatment'] = treatment;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['isActive'] = isActive;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discount'] = discount;
    data['currency'] = currency;
    if (images != null) {
      data['images'] = images;
    }
    data['id'] = id;
    return data;
  }
}
