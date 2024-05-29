class SI {
  // static const String base_url = "https://192.168.238.60:9001/api";
  static const String base_url =
      "https://healthcareintourism-test.azurewebsites.net/api";
  static const String all_clinics_url =
      "/Clinic/GetAllClinics?MaxResultCount=100";
  static const String recent_clinics_url =
      "/Clinic/GetAllClinics?MaxResultCount=4";
  static const String all_hotels_url = "/Hotel/GetAllHotels?MaxResultCount=100";
  static const String recent_hotels_url =
      "/Hotel/GetAllHotels?MaxResultCount=100";

  static const String offers_url = "/Search/SearchOffers";
  static const String recent_offers_url =
      "/Search/SearchOffers?MaxResultCount=4";

  static const String all_agency_url =
      "/Agency/GetAllAgencies?MaxResultCount=100";
  static const String recent_agency_url =
      "/Agency/GetAllAgencies?MaxResultCount=4";
  static const String all_offers_with_agency_url =
      "/Search/SearchOffers?AgencyId=";

  static const String clinic_by_id = "/Clinic/GetClinicById?Id=";
  static const String hotel_by_id = "/Hotel/GetHotelById?Id=";
  static const String agency_by_id = "/Agency/GetAgency?Id=";
}
