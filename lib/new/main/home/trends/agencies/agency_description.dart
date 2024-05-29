import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heatlh_tourism/utils/models/agency_model.dart';
import 'package:heatlh_tourism/utils/models/agency_solo_model.dart';

class AgencyDescription extends StatelessWidget {
  const AgencyDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final AgencyItemsModel product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    String phoneNumber = "";
    if (!(product.contactInformations == null ||
        product.contactInformations!.isEmpty)) {
      var element = product.contactInformations;
      Map<String, dynamic> productContactInfo = jsonDecode(element!);
      phoneNumber = productContactInfo['phone'];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: Text(
        //     product.name!,
        //     style: Theme.of(context).textTheme.titleLarge,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Text(
            (product.name == null || product.name!.isEmpty)
                ? ""
                : product.name!,
            style: TextStyle(
              fontSize: 23,
            ),
            maxLines: 3,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(
        //     left: 20,
        //     right: 20,
        //   ),
        //   child: Row(
        //     children: [
        //       Text(
        //         "agency name: ",
        //       ),
        //       Text(
        //         (product.agencyName == null || product.agencyName!.isEmpty)
        //             ? ""
        //             : product.agencyName!,
        //         maxLines: 3,
        //       )
        //     ],
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Text(
            (product.address == null || product.address!.isEmpty)
                ? "Address: "
                : "Address: ${product.address!}",
            maxLines: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            children: [
              Text(
                "Agency contact: " + phoneNumber,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildStarRating(int numberOfStars, {double size = 20.0}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < numberOfStars; i++)
          Icon(
            Icons.star,
            size: size,
            color: Colors.amber,
          ),
        for (int i = 0; i < 5 - numberOfStars; i++)
          Icon(
            Icons.star,
            size: size,
            color: Colors.grey,
          ),
      ],
    );
  }
}

class AgencySoloDescription extends StatelessWidget {
  const AgencySoloDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final AgencySoloData product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: Text(
        //     product.name!,
        //     style: Theme.of(context).textTheme.titleLarge,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            children: [
              Text(
                "name: ",
              ),
              Text(
                (product.name == null || product.name!.isEmpty)
                    ? ""
                    : product.name!,
                maxLines: 3,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            children: [
              Text(
                "agency name: ",
              ),
              Text(
                (product.agencyName == null || product.agencyName!.isEmpty)
                    ? ""
                    : product.agencyName!,
                maxLines: 3,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            children: [
              Text(
                "agency address: ",
              ),
              Text(
                (product.address == null || product.address!.isEmpty)
                    ? ""
                    : product.address!,
                maxLines: 3,
              )
            ],
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 20,
        //     vertical: 12,
        //   ),
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: Row(
        //       children: [
        //         buildStarRating(
        //           int.parse(product.star!),
        //         ),
        //         Text(
        //           "${product.star!}",
        //           style: TextStyle(
        //               fontWeight: FontWeight.w600, color: Color(0xFFFF7643)),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget buildStarRating(int numberOfStars, {double size = 20.0}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < numberOfStars; i++)
          Icon(
            Icons.star,
            size: size,
            color: Colors.amber,
          ),
        for (int i = 0; i < 5 - numberOfStars; i++)
          Icon(
            Icons.star,
            size: size,
            color: Colors.grey,
          ),
      ],
    );
  }
}
