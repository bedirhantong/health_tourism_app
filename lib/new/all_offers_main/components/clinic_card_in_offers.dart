import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heatlh_tourism/new/main/home/components/hotel_detail.dart';
import 'package:heatlh_tourism/utils/models/clinic_solo_model.dart';
import 'package:heatlh_tourism/utils/models/hotel_solo_model.dart';
import '../../../utils/models/agency_solo_model.dart';
import '../../main/home/components/agency_detail.dart';
import '../../main/home/components/clinics_detail.dart';

class ClinicCardInOffer extends StatelessWidget {
  final ClinicSoloData clinic;
  const ClinicCardInOffer({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsetsDirectional.all(20),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
        height: 200,
        child: GestureDetector(
          onTap: () {
            Get.to(
              DetailsScreenSoloClinic(product: clinic),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: clinic.imageUrls!.isEmpty
                    ? Image.asset(
                        "assets/images/clinics/clinic4.jpg",
                        fit: BoxFit.contain,
                      )
                    : Image.network(clinic.imageUrls![0]),
              ),
              const SizedBox(width: 8),
              Expanded(
                // Use Expanded to allow text to wrap
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clinic.name!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        // Use Flexible to allow description to wrap
                        child: Text(
                          clinic.address!,
                          style: TextStyle(fontSize: 16),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class HotelCardInOffer extends StatelessWidget {
  final HotelSoloData soloHotel;
  const HotelCardInOffer({super.key, required this.soloHotel});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsetsDirectional.all(20),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
        height: 200,
        child: GestureDetector(
          onTap: () {
            Get.to(
              DetailsScreenSoloHotel(product: soloHotel),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: soloHotel.imageUrls!.isEmpty
                    ? Image.asset(
                        "assets/images/hotels/hotel1.jpg",
                        fit: BoxFit.contain,
                      )
                    : Image.network(
                        soloHotel.imageUrls![0],
                        fit: BoxFit.fitHeight,
                      ),
              ),
              const SizedBox(width: 8),
              Expanded(
                // Use Expanded to allow text to wrap
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        soloHotel.name!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3, // Ensure treatment doesn't exceed one line
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        // Use Flexible to allow description to wrap
                        child: Text(
                          soloHotel.address!,
                          maxLines: 3,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class AgencyCardInOffer extends StatelessWidget {
  final AgencySoloData soloAgency;
  const AgencyCardInOffer({super.key, required this.soloAgency});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsetsDirectional.all(20),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
        height: 200,
        child: GestureDetector(
          onTap: () {
            Get.to(
              DetailsScreenSoloAgency(product: soloAgency),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: soloAgency.picture!.isEmpty
                    ? Image.asset(
                        "assets/images/hotels/hotel1.jpg",
                        fit: BoxFit.contain,
                      )
                    : Image.network(
                        soloAgency.picture!,
                        fit: BoxFit.fitHeight,
                      ),
              ),
              const SizedBox(width: 8),
              Expanded(
                // Use Expanded to allow text to wrap
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        soloAgency.name!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2, // Ensure treatment doesn't exceed one line
                      ),
                      SizedBox(height: 2),
                      Text(
                        soloAgency.agencyName!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2, // Ensure treatment doesn't exceed one line
                      ),
                      SizedBox(height: 2),
                      Flexible(
                        // Use Flexible to allow description to wrap
                        child: Text(
                          soloAgency.address!,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
