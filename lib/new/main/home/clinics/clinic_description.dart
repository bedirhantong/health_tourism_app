import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heatlh_tourism/utils/models/clinic_solo_model.dart';
import '../../../../utils/models/clinic_model.dart';

class ClinicDescription extends StatelessWidget {
  const ClinicDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final ClinicModelItems product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            product.name!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            product.description!,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            product.cityName! +
                "/ " +
                product.regionName! +
                "/ " +
                product.countryName!,
            maxLines: 3,
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

class ClinicSoloDescription extends StatelessWidget {
  const ClinicSoloDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final ClinicSoloData product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            product.name!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            product.description!,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            product.cityName! +
                "/ " +
                product.regionName! +
                "/ " +
                product.countryName!,
            maxLines: 3,
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
