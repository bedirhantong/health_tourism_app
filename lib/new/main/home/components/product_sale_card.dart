import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/model/offer_model.dart';
import '../../../../utils/constants/app/app_typography.dart';
import '../../../../utils/constants/app/color_strings.dart';
import '../../../../utils/constants/app/image_strings.dart';
import '../../../../view/comman_components/animations/fade_in_left_animation.dart';
import '../product_detail_page.dart';

class ProductSaleCard extends StatelessWidget {
  final OfferModel product;
  final bool isCartPage;
  final int index;
  const ProductSaleCard({
    super.key,
    required this.index,
    required this.product,
    this.isCartPage = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    final delay = Duration(milliseconds: 100 * index);
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailPage(product: product));
      },
      child: FadeInLeft(
        duration: const Duration(milliseconds: 500),
        delay: delay,
        child: Container(
          height: 180.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          color: isDarkMode(context) ? AppColor.kSecondary5 : product.bgCol,
          child: Row(
            children: [
              Hero(
                tag: product.image,
                child: Image.asset(product.image[0],
                    width: 150.w, fit: BoxFit.cover),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      product.name.length > 26
                          ? '${product.name.substring(0, 20)}...'
                          : product.name,
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: AppTypography.kMedium14
                          .copyWith(color: AppColor.kBlackColor)),
                  Text(
                    '\$ ${product.price.toInt()}',
                    style: AppTypography.kBold20,
                  ),
                  Text(
                    '\$ ${product.discountPrice}',
                    style: AppTypography.kMedium14.copyWith(
                        color: AppColor.kSecondary,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColor.kSecondary),
                  ),
                  SizedBox(height: 10.h),
                  isCartPage
                      ? IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(ImagesPath.kDelete),
                        )
                      : Text("")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
