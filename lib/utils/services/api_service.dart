import 'dart:convert';

import 'package:heatlh_tourism/utils/constants/api/api_const.dart';
import 'package:heatlh_tourism/utils/models/agency_solo_model.dart';
import 'package:heatlh_tourism/utils/models/clinic_model.dart';
import 'package:heatlh_tourism/utils/models/clinic_solo_model.dart';
import 'package:heatlh_tourism/utils/models/hotel_model.dart';
import 'package:heatlh_tourism/utils/models/hotel_solo_model.dart';
import 'package:http/http.dart' as http;
import '../models/agency_model.dart';
import '../models/offer_model.dart';
import '../models/treatment_model.dart';

class APIService {
  APIService();
  Future<List<ClinicModelItems>?> getAllClinics() async {
    var url = Uri.parse(SI.base_url + SI.all_clinics_url);
    final response = await http.get(url);

    Map<String, dynamic> responseList = jsonDecode(response.body);
    final clinicModel = ClinicModel.fromJson(responseList);
    final clinicItems = clinicModel.data!.items;

    return clinicItems;
  }

  Future<List<ClinicModelItems>?> getRecentAllClinics() async {
    var url = Uri.parse(SI.base_url + SI.recent_clinics_url);
    final response = await http.get(url);

    Map<String, dynamic> responseList = jsonDecode(response.body);
    final clinicModel = ClinicModel.fromJson(responseList);
    final clinicItems = clinicModel.data!.items;

    return clinicItems;
  }

  // Get offers by clinic ID
  Future<ClinicSoloData> getClinicByClinicId(int id) async {
    var url = Uri.parse(
        "https://healthcareintourism-test.azurewebsites.net/api/Clinic/GetClinicById?Id=" +
            "${id}");
    final response = await http.get(url);

    Map<String, dynamic> responseList = jsonDecode(response.body);
    final clinicModel = ClinicSolo.fromJson(responseList);
    final clinicItem = clinicModel.data!;
    return clinicItem;
  }

  Future<List<AgencyItemsModel>?> getAllAgencies() async {
    var url = Uri.parse(SI.base_url + SI.all_agency_url);
    final response = await http.get(url);

    Map<String, dynamic> responseList = jsonDecode(response.body);
    final agencyModel = Agency.fromJson(responseList);
    final agencyModelItems = agencyModel.data!.items;

    return agencyModelItems;
  }

  Future<List<AgencyItemsModel>?> getRecentAllAgencies() async {
    var url = Uri.parse(SI.base_url + SI.recent_agency_url);
    final response = await http.get(url);

    Map<String, dynamic> responseList = jsonDecode(response.body);
    final agencyModel = Agency.fromJson(responseList);
    final agencyModelItems = agencyModel.data!.items;

    return agencyModelItems;
  }

  Future<AgencySoloData> getAgencyById(String id) async {
    var url = Uri.parse(SI.base_url + SI.agency_by_id + "${id}");
    final response = await http.get(url);

    Map<String, dynamic> responseList = jsonDecode(response.body);
    final agencyModel = AgencySolo.fromJson(responseList);
    final agencySoloModel = agencyModel.data!;

    return agencySoloModel;
  }

  Future<HotelSoloData> getHotelById(int id) async {
    var url = Uri.parse(SI.base_url + SI.hotel_by_id + "${id}");
    final response = await http.get(url);

    Map<String, dynamic> responseList = jsonDecode(response.body);
    final hotelModel = HotelSolo.fromJson(responseList);
    final hotelItems = hotelModel.data!;
    return hotelItems;
  }

  Future<List<HotelModelItems>?> getAllHotels() async {
    var url = Uri.parse(SI.base_url + SI.all_hotels_url);
    final response = await http.get(url);

    Map<String, dynamic> responseList = jsonDecode(response.body);
    final hotelItems = HotelModel.fromJson(responseList).data!.items;
    return hotelItems;
  }

  // Get all offers
  Future<List<OfferModelItems>?> getAllOffers() async {
    var url = Uri.parse(SI.base_url + SI.offers_url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      final offerModel = OfferModel.fromJson(responseList);
      final offerItems = offerModel.data!.items;
      return offerItems;
    } else {
      return null;
    }
  }

  Future<List<OfferModelItems>?> getRecentOffers() async {
    var url = Uri.parse(SI.base_url + SI.recent_offers_url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      final offerModel = OfferModel.fromJson(responseList);
      final offerItems = offerModel.data!.items;
      return offerItems;
    } else {
      return null;
    }
  }

  // Get offers by Treatment ID, Hotel ID, and Clinic ID
  Future<List<OfferModelItems>?> getOffersWithAllParams(
      {int? treatmentId, int? hotelId, int? clinicId}) async {
    var uri = Uri.parse(SI.base_url +
        SI.offers_url +
        "?TreamnentId=$treatmentId" +
        "&HotelId=$hotelId" +
        "&ClinicId=$clinicId");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      final offerModel = OfferModel.fromJson(responseList);
      final offerItems = offerModel.data!.items;
      return offerItems;
    } else {
      return null;
    }
  }

  Future<List<TreatmentModelItems>?> getAllTreatments() async {
    var url = Uri.parse(
        'https://healthcareintourism-test.azurewebsites.net/api/Treatment/GetAllTreatments');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      final treatmentModel = TreatmentModel.fromJson(responseList);
      return treatmentModel.data?.items;
    } else {
      throw Exception('Failed to load treatments');
    }
  }

  Future<List<OfferModelItems>?> getOffersSearchWithDesc(
      {String? something}) async {
    var uri =
        Uri.parse(SI.base_url + SI.offers_url + "?Description=$something");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      final offerModel = OfferModel.fromJson(responseList);
      final offerItems = offerModel.data!.items;
      return offerItems;
    } else {
      return null;
    }
  }

  // Get offers by treatment ID
  Future<List<OfferModelItems>?> getOffersByTreatmentId(int treatmentId) async {
    var url =
        Uri.parse(SI.base_url + SI.offers_url + "?TreatmentId=$treatmentId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      final offerModel = OfferModel.fromJson(responseList);
      final offerItems = offerModel.data!.items;
      return offerItems;
    } else {
      return null;
    }
  }

  // Get offers by hotel ID
  Future<List<OfferModelItems>?> getOffersByHotelId(int hotelId) async {
    var url = Uri.parse(SI.base_url + SI.offers_url + "?HotelId=$hotelId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      final offerModel = OfferModel.fromJson(responseList);
      final offerItems = offerModel.data!.items;
      return offerItems;
    } else {
      return null;
    }
  }

  // Get offers by clinic ID
  Future<List<OfferModelItems>?> getOffersByClinicId(int clinicId) async {
    var url = Uri.parse(SI.base_url + SI.offers_url + "?ClinicId=$clinicId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      final offerModel = OfferModel.fromJson(responseList);
      final offerItems = offerModel.data!.items;
      return offerItems;
    } else {
      return null;
    }
  }

  // Get offers by agency ID
  Future<List<OfferModelItems>?> getOffersByAgencyId(String agencyId) async {
    var url =
        Uri.parse(SI.base_url + SI.all_offers_with_agency_url + "$agencyId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseList = jsonDecode(response.body);
      final offerModel = OfferModel.fromJson(responseList);
      final offerItems = offerModel.data!.items;
      return offerItems;
    } else {
      return null;
    }
  }
}
