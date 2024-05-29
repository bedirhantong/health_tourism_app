import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heatlh_tourism/utils/models/clinic_solo_model.dart';
import '../../../../utils/models/clinic_model.dart';
import '../../../../view/comman_components/buttons/primary_button.dart';
import '../../../components/bottom_sheet_contact.dart';
import '../../../components/offers_by_clinicId.dart';
import '../clinics/clinic_description.dart';
import '../clinics/clinic_images.dart';
import '../trends/clinics_trending/components/top_rounded_container.dart';

class DetailsScreenClinic extends StatefulWidget {
  const DetailsScreenClinic({super.key, required this.product});
  final ClinicModelItems product;

  @override
  State<DetailsScreenClinic> createState() => _DetailsScreenClinicState();
}

class _DetailsScreenClinicState extends State<DetailsScreenClinic> {
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
          CProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ClinicDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      OffersByClinicId(product: widget.product),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 20),
                  height: 250.h,
                  child: GoogleMap(
                    mapType: MapType.values[1],
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          double.parse(widget.product.latitude.toString()),
                          double.parse(widget.product.longitude.toString())),
                      zoom: 11.0,
                      // tilt: 20.0,
                      // bearing: 15.0,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId(widget.product.name.toString()),
                        position: LatLng(
                            double.parse(widget.product.latitude.toString()),
                            double.parse(widget.product.longitude.toString())),
                        onTap: () {},
                        infoWindow: InfoWindow(
                          title: widget.product.name.toString(),
                          snippet: widget.product.name.toString(),
                        ),
                      ),
                    },
                  ),
                ),
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
                  phone: widget.product.phone!,
                  email: widget.product.email!,
                ),
              );
            },
            text: 'Contact'),
      ),
    );
  }
}

class DetailsScreenSoloClinic extends StatefulWidget {
  const DetailsScreenSoloClinic({super.key, required this.product});
  final ClinicSoloData product;

  @override
  State<DetailsScreenSoloClinic> createState() =>
      _DetailsScreenSoloClinicState();
}

class _DetailsScreenSoloClinicState extends State<DetailsScreenSoloClinic> {
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
          CSoloProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ClinicSoloDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      OffersByClinicId2(
                        id: widget.product.id!,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 20),
                  height: 250.h,
                  child: GoogleMap(
                    mapType: MapType.values[1],
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          double.parse(widget.product.latitude.toString()),
                          double.parse(widget.product.longitude.toString())),
                      zoom: 11.0,
                      // tilt: 20.0,
                      // bearing: 15.0,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId(widget.product.name.toString()),
                        position: LatLng(
                            double.parse(widget.product.latitude.toString()),
                            double.parse(widget.product.longitude.toString())),
                        onTap: () {},
                        infoWindow: InfoWindow(
                          title: widget.product.name.toString(),
                          snippet: widget.product.name.toString(),
                        ),
                      ),
                    },
                  ),
                ),
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
                  phone: widget.product.phone!,
                  email: widget.product.email!,
                ),
              );
            },
            text: 'Contact'),
      ),
    );
  }
}
