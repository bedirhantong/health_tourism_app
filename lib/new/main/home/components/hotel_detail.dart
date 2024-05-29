import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heatlh_tourism/new/main/home/components/snackbar.dart';
import 'package:heatlh_tourism/utils/models/hotel_solo_model.dart';
import '../../../../utils/models/hotel_model.dart';
import '../../../../view/comman_components/buttons/primary_button.dart';
import '../../../components/bottom_sheet_contact.dart';
import '../../../components/offers_by_clinicId.dart';
import '../hotels/hotel_description.dart';
import '../hotels/hotel_images.dart';
import '../trends/clinics_trending/components/top_rounded_container.dart';

class DetailsScreenHotel extends StatefulWidget {
  const DetailsScreenHotel({super.key, required this.product});
  final HotelModelItems product;

  @override
  _DetailsScreenHotelState createState() => _DetailsScreenHotelState();
}

class _DetailsScreenHotelState extends State<DetailsScreenHotel> {
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
        title: Text(
          widget.product.name!,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
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
          HProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                HotelDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
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
                      OffersByHotelId(product: widget.product),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      Text(
                        "Hotel on Map",
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
                                'Here is just a quick access place for you to view hotel location.'),
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
                Container(
                  padding:
                      EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 20),
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

class DetailsScreenSoloHotel extends StatefulWidget {
  const DetailsScreenSoloHotel({super.key, required this.product});
  final HotelSoloData product;

  @override
  _DetailsScreenSoloHotelState createState() => _DetailsScreenSoloHotelState();
}

class _DetailsScreenSoloHotelState extends State<DetailsScreenSoloHotel> {
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
        title: Text(
          widget.product.name!,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
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
          HSoloProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                HotelSoloDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
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
                      OffersBySoloHotelId(product: widget.product),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    children: [
                      Text(
                        "Hotel on Map",
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
                                'Here is just a quick access place for you to view hotel location.'),
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
                Container(
                  padding:
                      EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 20),
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
