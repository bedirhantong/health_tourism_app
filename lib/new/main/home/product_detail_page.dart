import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/model/offer_model.dart';
import '../../../utils/constants/app/app_typography.dart';
import '../../../utils/constants/app/color_strings.dart';
import '../../../view/comman_components/buttons/primary_button.dart';

class ProductDetailPage extends StatelessWidget {
  final OfferModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kSecondary,
        elevation: 10,
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      product.name,
                      maxLines: 2,
                      style: AppTypography.kBold20,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$ ${product.discountPrice.toInt()}',
                        style: AppTypography.kMedium14.copyWith(
                            color: AppColor.kSecondary3,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColor.kSecondary6),
                      ),
                      Text(
                        '\$ ${product.price.toInt()}',
                        style: AppTypography.kBold20,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(color: AppColor.kLine),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text('DESCRIPTION', style: AppTypography.kMedium14),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child:
                  Text(product.description, style: AppTypography.kExtraLight12),
            ),
            Divider(color: AppColor.kLightAccentColor),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text('Offer Reviews (120) ', style: AppTypography.kMedium14),
                  ...List.generate(
                      5,
                      (index) => Icon(Icons.star,
                          size: 18.h, color: AppColor.kSecondary5))
                ],
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.all(20.h),
        child: PrimaryButton(onTap: () {}, text: 'See offers'),
      ),
    );
  }
}
