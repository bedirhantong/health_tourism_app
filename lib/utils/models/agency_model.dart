class Agency {
  bool? succeeded;
  String? message;
  String? errors;
  Data? data;

  Agency({this.succeeded, this.message, this.errors, this.data});

  Agency.fromJson(Map<String, dynamic> json) {
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
  List<AgencyItemsModel>? items;

  Data({this.totalCount, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <AgencyItemsModel>[];
      json['items'].forEach((v) {
        items!.add(new AgencyItemsModel.fromJson(v));
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

class AgencyItemsModel {
  String? name;
  String? agencyName;
  String? picture;
  String? contactInformations;
  String? address;
  String? id;

  AgencyItemsModel(
      {this.name,
      this.agencyName,
      this.picture,
      this.contactInformations,
      this.address,
      this.id});

  AgencyItemsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    agencyName = json['agencyName'];
    picture = json['picture'];
    contactInformations = json['contactInformations'];
    address = json['address'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['agencyName'] = this.agencyName;
    data['picture'] = this.picture;
    data['contactInformations'] = this.contactInformations;
    data['address'] = this.address;
    data['id'] = this.id;
    return data;
  }
}
