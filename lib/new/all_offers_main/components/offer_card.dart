import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/models/offer_model.dart';
import 'offer_detail.dart';

class OfferCard extends StatelessWidget {
  final OfferModelItems offer;
  const OfferCard({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          OfferDetailHome(offer: offer),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: offer.images!.isEmpty
                    ? Image.asset(
                        "assets/images/offers/akne_tedavisi.jpg",
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        offer.images![0],
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${offer.treatment! ?? ''}",

                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2, // Ensure treatment doesn't exceed one line
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${offer.title! ?? ''}",

                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2, // Ensure title doesn't exceed two lines
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${offer.agency!.name ?? ''}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                        overflow: TextOverflow.ellipsis,
                        maxLines:
                            1, // Ensure agency name doesn't exceed one line
                      ),
                      Row(
                        children: [
                          Text(
                            "Hotel: ${offer.hotel!.name ?? ''}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                            maxLines:
                                1, // Ensure agency name doesn't exceed one line
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Price:  ${offer.price?.toStringAsFixed(2) ?? ''} ${offer.currency ?? ''}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
