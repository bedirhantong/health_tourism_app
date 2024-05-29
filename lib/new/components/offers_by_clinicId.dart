import 'package:flutter/material.dart';
import 'package:heatlh_tourism/new/components/product_mini_shimmer.dart';
import 'package:heatlh_tourism/utils/models/agency_model.dart';
import 'package:heatlh_tourism/utils/models/agency_solo_model.dart';
import 'package:heatlh_tourism/utils/models/hotel_model.dart';
import 'package:heatlh_tourism/utils/models/hotel_solo_model.dart';
import '../../utils/models/clinic_model.dart';
import '../../utils/services/api_service.dart';
import '../all_offers_main/components/offer_card.dart';

class OffersByClinicId extends StatelessWidget {
  const OffersByClinicId({super.key, required this.product});
  final ClinicModelItems product;

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();
    return FutureBuilder(
      future: apiService.getOffersByClinicId(product.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No offers available'));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                snapshot.data!.length,
                (index) => OfferCard(
                  offer: snapshot.data![index],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class OffersByClinicId2 extends StatelessWidget {
  const OffersByClinicId2({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();
    return FutureBuilder(
      future: apiService.getOffersByClinicId(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No offers available'));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                snapshot.data!.length,
                (index) => OfferCard(
                  offer: snapshot.data![index],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class OffersByHotelId extends StatelessWidget {
  const OffersByHotelId({super.key, required this.product});
  final HotelModelItems product;

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();
    return FutureBuilder(
      future: apiService.getOffersByHotelId(product.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No offers available'));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                snapshot.data!.length,
                (index) => OfferCard(
                  offer: snapshot.data![index],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class OffersBySoloHotelId extends StatelessWidget {
  const OffersBySoloHotelId({super.key, required this.product});
  final HotelSoloData product;

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();
    return FutureBuilder(
      future: apiService.getOffersByHotelId(product.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No offers available'));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                snapshot.data!.length,
                (index) => OfferCard(
                  offer: snapshot.data![index],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class AllOffers extends StatelessWidget {
  const AllOffers({super.key});
  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();
    return FutureBuilder(
      future: apiService.getRecentOffers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ShimmerOfferClinicHotel();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No offers available'));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Row(
                children: List.generate(
                  snapshot.data!.length,
                  (index) => OfferCard(
                    offer: snapshot.data![index],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class OffersByAgencyId extends StatelessWidget {
  const OffersByAgencyId({super.key, required this.product});
  final AgencyItemsModel product;

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();
    return FutureBuilder(
      future: apiService.getOffersByAgencyId(product.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No offers available'));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                snapshot.data!.length,
                (index) => OfferCard(
                  offer: snapshot.data![index],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class OffersBySoloAgencyId extends StatelessWidget {
  const OffersBySoloAgencyId({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();
    return FutureBuilder(
      future: apiService.getOffersByAgencyId(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No offers available'));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                snapshot.data!.length,
                (index) => OfferCard(
                  offer: snapshot.data![index],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
