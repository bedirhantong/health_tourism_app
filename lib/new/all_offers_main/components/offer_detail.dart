import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/models/offer_model.dart';
import '../../../utils/services/api_service.dart';
import '../../main/home/components/snackbar.dart';
import '../../main/home/trends/clinics_trending/components/product_images.dart';
import 'clinic_card_in_offers.dart';

class OfferDetailHome extends StatefulWidget {
  final OfferModelItems offer;

  const OfferDetailHome({super.key, required this.offer});

  @override
  State<OfferDetailHome> createState() => _OfferDetailHomeState();
}

class _OfferDetailHomeState extends State<OfferDetailHome> {
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    int selectedImages = 0;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.offer.title!,
          maxLines: 3,
        ),
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
        actions: [],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: 538,
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: widget.offer.images!.isEmpty
                      ? Image.asset(
                          "assets/images/offers/akne_tedavisi.jpg",
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          widget.offer.images![0],
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      1,
                      (index) => SmallProductImage(
                            isSelected: index == selectedImages,
                            press: () {
                              setState(() {
                                selectedImages = index;
                              });
                            },
                            image: widget.offer.images!.isEmpty
                                ? "assets/images/offers/akne_tedavisi.jpg"
                                : widget.offer.images![0],
                          ))
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(top: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Text(
                //     "Title: " + widget.offer.title!,
                //     style: Theme.of(context).textTheme.titleLarge,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 64,
                  ),
                  child: Text(
                    "Description: " + widget.offer.description!,
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 64,
                  ),
                  child: Text(
                    widget.offer.hotel!.name!,
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 64,
                  ),
                  child: Text(
                    widget.offer.agency!.name!,
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Clinic",
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
                                'Here is just a quick access place for you to view clinics.'),
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
                  // margin: const EdgeInsets.only(top: 20),
                  // padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: FutureBuilder(
                    future: apiService
                        .getClinicByClinicId(widget.offer.clinic!.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return ClinicCardInOffer(
                          clinic: snapshot.data!,
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Hotel",
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
                                'Here is just a quick access place for you to view clinics.'),
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
                  // margin: const EdgeInsets.only(top: 20),
                  // padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: FutureBuilder(
                    future: apiService.getHotelById(widget.offer.hotel!.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return HotelCardInOffer(
                          soloHotel: snapshot.data!,
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 20),
                  child: Row(
                    children: [
                      Text(
                        "Agency",
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
                                'Here is just a quick access place for you to view agency.'),
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
                  // margin: const EdgeInsets.only(top: 20),
                  // padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: FutureBuilder(
                    future: apiService.getAgencyById(widget.offer.agency!.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        return AgencyCardInOffer(
                          soloAgency: snapshot.data!,
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
