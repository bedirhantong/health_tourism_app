import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/constants/app/app_typography.dart';
import '../../utils/constants/app/color_strings.dart';
import '../../utils/constants/app/image_strings.dart';
import '../../utils/models/clinic_model.dart';
import '../../utils/services/api_service.dart';
import '../../view/comman_components/animations/bouncing_animation.dart';
import '../components/product_mini_shimmer.dart';
import '../main/home/components/clinics_detail.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.h),
          FutureBuilder(
            future: apiService.getAllClinics(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  padding: EdgeInsets.only(right: 5, left: 5, bottom: 40),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemBuilder: (context, index) {
                    return ClinicCard(
                      item: snapshot.data![index],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return ShimmerOfferClinicHotel();
            },
          ),
        ],
      ),
    );
  }
}

class ClinicCard extends StatelessWidget {
  final ClinicModelItems item;
  const ClinicCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingAnimation(
      onTap: () {
        Get.to(
          () => DetailsScreenClinic(
            product: item,
          ),
        );
      },
      child: SizedBox(
        height: 280.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 23.w),
                decoration: BoxDecoration(gradient: AppColor.kGradient1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name!,
                      style: AppTypography.kBold16
                          .copyWith(color: AppColor.kLightAccentColor),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      item.description.toString(),
                      style: AppTypography.kMedium12.copyWith(
                        color: AppColor.kLightAccentColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      item.email.toString(),
                      style: AppTypography.kMedium12
                          .copyWith(color: AppColor.kLightAccentColor),
                    ),
                    Text(
                      item.address.toString(),
                      style: AppTypography.kMedium12
                          .copyWith(color: AppColor.kLightAccentColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: item.imageUrls!.isEmpty
                    ? Image.asset(
                        ImagesPath.clinic8,
                        fit: BoxFit.fitWidth,
                        width: double.maxFinite,
                      )
                    : Image.network(
                        item.imageUrls![0],
                        fit: BoxFit.fitWidth,
                        width: double.maxFinite,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
