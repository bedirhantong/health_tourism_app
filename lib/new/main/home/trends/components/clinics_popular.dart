import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/services/api_service.dart';
import '../../../../components/product_mini_shimmer.dart';
import '../../components/clinics_detail.dart';
import '../clinics_trending/clinic_card.dart';

class ClinicsPopular extends StatefulWidget {
  const ClinicsPopular({super.key});

  @override
  State<ClinicsPopular> createState() => _ClinicsPopularState();
}

class _ClinicsPopularState extends State<ClinicsPopular> {
  APIService apiService = APIService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getRecentAllClinics(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                snapshot.data!.length,
                (index) {
                  return PopularClinicCard(
                    product: snapshot.data![index],
                    onPress: () => Get.to(
                      () => DetailsScreenClinic(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
              ),
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
