import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heatlh_tourism/new/components/offers_by_clinicId.dart';
import 'package:heatlh_tourism/new/main/home/components/snackbar.dart';
import 'package:heatlh_tourism/utils/models/agency_model.dart';
import 'package:heatlh_tourism/utils/models/agency_solo_model.dart';
import '../../../../view/comman_components/buttons/primary_button.dart';
import '../../../components/bottom_sheet_contact.dart';
import '../trends/agencies/agency_description.dart';
import '../trends/agencies/agency_product_images.dart';
import '../trends/clinics_trending/components/top_rounded_container.dart';

class DetailsScreenAgency extends StatefulWidget {
  const DetailsScreenAgency({super.key, required this.product});
  final AgencyItemsModel product;

  @override
  _DetailsScreenAgencyState createState() => _DetailsScreenAgencyState();
}

class _DetailsScreenAgencyState extends State<DetailsScreenAgency> {
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    String phoneNumber = "";
    if (!(widget.product.contactInformations == null ||
        widget.product.contactInformations!.isEmpty)) {
      var element = widget.product.contactInformations;
      Map<String, dynamic> productContactInfo = jsonDecode(element!);
      phoneNumber = productContactInfo['phone'];
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: AProductImages(product: widget.product),
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                AgencyDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      Text(
                        "Offers",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(width: 12.w),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            AwesomeSnackbar('Hi There!',
                                'Here is just a quick access place for you to view recent uploaded agencies.'),
                          );
                        },
                        child: Text(
                          "How it works?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: OffersByAgencyId(product: widget.product),
                ),
                // Container(
                //   padding:
                //       EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 20),
                //   height: 250.h,
                //   child: GoogleMap(
                //     mapType: MapType.values[1],
                //     onMapCreated: _onMapCreated,
                //     initialCameraPosition: CameraPosition(
                //       target: LatLng(
                //           double.parse(widget.product.latitude.toString()),
                //           double.parse(widget.product.longitude.toString())),
                //       zoom: 11.0,
                //       // tilt: 20.0,
                //       // bearing: 15.0,
                //     ),
                //     markers: {
                //       Marker(
                //         markerId: MarkerId(widget.product.name.toString()),
                //         position: LatLng(
                //             double.parse(widget.product.latitude.toString()),
                //             double.parse(widget.product.longitude.toString())),
                //         onTap: () {},
                //         infoWindow: InfoWindow(
                //           title: widget.product.name.toString(),
                //           snippet: widget.product.name.toString(),
                //         ),
                //       ),
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20.h),
        child: PrimaryButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ContactInfoClinicBottomSheet(
                  phone: phoneNumber,
                  email: "",
                ),
              );
            },
            text: 'Contact'),
      ),
    );
  }
}

class DetailsScreenSoloAgency extends StatefulWidget {
  const DetailsScreenSoloAgency({super.key, required this.product});
  final AgencySoloData product;

  @override
  _DetailsScreenSoloAgencyState createState() =>
      _DetailsScreenSoloAgencyState();
}

class _DetailsScreenSoloAgencyState extends State<DetailsScreenSoloAgency> {
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(widget.product.name!),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ASoloProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                AgencySoloDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      Text(
                        "Offers",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(width: 12.w),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            AwesomeSnackbar('Hi There!',
                                'Here is just a quick access place for you to view recent uploaded agencies.'),
                          );
                        },
                        child: Text(
                          "How it works?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: OffersBySoloAgencyId(id: widget.product.id!),
                ),
                // Container(
                //   padding:
                //       EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 20),
                //   height: 250.h,
                //   child: GoogleMap(
                //     mapType: MapType.values[1],
                //     onMapCreated: _onMapCreated,
                //     initialCameraPosition: CameraPosition(
                //       target: LatLng(
                //           double.parse(widget.product.latitude.toString()),
                //           double.parse(widget.product.longitude.toString())),
                //       zoom: 11.0,
                //       // tilt: 20.0,
                //       // bearing: 15.0,
                //     ),
                //     markers: {
                //       Marker(
                //         markerId: MarkerId(widget.product.name.toString()),
                //         position: LatLng(
                //             double.parse(widget.product.latitude.toString()),
                //             double.parse(widget.product.longitude.toString())),
                //         onTap: () {},
                //         infoWindow: InfoWindow(
                //           title: widget.product.name.toString(),
                //           snippet: widget.product.name.toString(),
                //         ),
                //       ),
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   color: Theme.of(context).scaffoldBackgroundColor,
      //   padding: EdgeInsets.all(20.h),
      //   child: PrimaryButton(
      //       onTap: () {
      //         showModalBottomSheet(
      //           context: context,
      //           builder: (context) => ContactInfoClinicBottomSheet(
      //             phone: widget.product.phone!,
      //             email: widget.product.email!,
      //           ),
      //         );
      //       },
      //       text: 'Contact'),
      // ),
    );
  }
}
