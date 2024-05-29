import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/constants/app/app_typography.dart';
import '../../utils/constants/app/color_strings.dart';
import '../../utils/constants/app/image_strings.dart';
import '../../utils/models/hotel_model.dart';
import '../../utils/services/api_service.dart';
import '../../view/comman_components/animations/bouncing_animation.dart';
import '../components/product_mini_shimmer.dart';
import '../main/home/components/hotel_detail.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();

    return FutureBuilder(
      future: apiService.getAllHotels(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => SizedBox(height: 25.h),
            itemBuilder: (context, index) {
              return HotelCard(item: snapshot.data![index]);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return ShimmerOfferClinicHotel();
      },
    );
  }
}

class HotelCard extends StatefulWidget {
  final HotelModelItems item;
  const HotelCard({
    super.key,
    required this.item,
  });

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    return BouncingAnimation(
      onTap: () {
        Get.to(
          () => DetailsScreenHotel(
            product: widget.item,
          ),
        );
      },
      child: SizedBox(
        height: 230.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 23.w),
                decoration: BoxDecoration(gradient: AppColor.kGradient3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.name!,
                      style: AppTypography.kBold16
                          .copyWith(color: AppColor.kLightAccentColor),
                    ),
                    // buildStarRating(int.parse(item.star.toString())),
                    Text(
                      widget.item.regionName.toString() +
                          "/" +
                          widget.item.cityName.toString(),
                      style: AppTypography.kMedium12
                          .copyWith(color: AppColor.kLightAccentColor),
                    ),
                    Text(
                      "Phone: " + widget.item.phone.toString(),
                      style: AppTypography.kMedium12
                          .copyWith(color: AppColor.kLightAccentColor),
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: widget.item.imageUrls!.isEmpty
                      ? Image.asset(
                          ImagesPath.hotel1,
                          fit: BoxFit.cover,
                          width: double.maxFinite,
                        )
                      : Image.network(
                          widget.item.imageUrls![0],
                          fit: BoxFit.fitWidth,
                          width: double.maxFinite,
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
