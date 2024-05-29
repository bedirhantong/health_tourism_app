class AgencySolo {
  bool? succeeded;
  String? message;
  String? errors;
  AgencySoloData? data;

  AgencySolo({this.succeeded, this.message, this.errors, this.data});

  AgencySolo.fromJson(Map<String, dynamic> json) {
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    data =
        json['data'] != null ? new AgencySoloData.fromJson(json['data']) : null;
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

class AgencySoloData {
  String? name;
  String? agencyName;
  String? picture;
  String? contactInformations;
  String? address;
  String? id;

  AgencySoloData(
      {this.name,
      this.agencyName,
      this.picture,
      this.contactInformations,
      this.address,
      this.id});

  AgencySoloData.fromJson(Map<String, dynamic> json) {
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
