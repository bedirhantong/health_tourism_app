import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heatlh_tourism/utils/constants/app/color_strings.dart';
import '../../../../../utils/models/agency_model.dart';
import '../../../../../utils/services/api_service.dart';
import '../../../../components/product_mini_shimmer.dart';
import '../../components/agency_detail.dart';

class AgencyListScreen extends StatefulWidget {
  const AgencyListScreen({super.key});

  @override
  State<AgencyListScreen> createState() => _AgencyListScreenState();
}

class _AgencyListScreenState extends State<AgencyListScreen> {
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getAllAgencies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(snapshot.data!.length, (index) {
                return AgencyCard(
                  width: 200,
                  aspectRtio: 1.2,
                  product: snapshot.data![index],
                  onPress: () {
                    Get.to(
                      DetailsScreenAgency(
                        product: snapshot.data![index],
                      ),
                    );
                  },
                );
              }),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return TrendClinicsShimmer();
      },
    );
  }
}

class AgencyCard extends StatelessWidget {
  const AgencyCard(
      {super.key,
      required this.width,
      required this.aspectRtio,
      required this.product,
      required this.onPress});
  final double width, aspectRtio;
  final AgencyItemsModel product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: AspectRatio(
                  aspectRatio: aspectRtio,
                  child: (product.picture == null || product.picture!.isEmpty)
                      ? Image.asset(
                          "assets/images/clinics/clinic7.jpg",
                          fit: BoxFit.contain,
                        )
                      : Image.network(
                          product.picture!,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? "Unknown",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        product.address ?? "Unknown Agency",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 3),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: onPress,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "View Details",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
