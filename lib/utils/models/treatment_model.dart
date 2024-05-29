class TreatmentModel {
  bool? succeeded;
  String? message;
  String? errors;
  TreatmentData? data;

  TreatmentModel({this.succeeded, this.message, this.errors, this.data});

  TreatmentModel.fromJson(Map<String, dynamic> json) {
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    data = json['data'] != null ? TreatmentData.fromJson(json['data']) : null;
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

class TreatmentData {
  int? totalCount;
  List<TreatmentModelItems>? items;

  TreatmentData({this.totalCount, this.items});

  TreatmentData.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(TreatmentModelItems.fromJson(v));
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

class TreatmentModelItems {
  int? id;
  String? name;
  String? description;

  TreatmentModelItems({this.name, this.description, this.id});

  TreatmentModelItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
