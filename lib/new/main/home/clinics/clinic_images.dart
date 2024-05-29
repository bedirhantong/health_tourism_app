import 'package:flutter/material.dart';
import 'package:heatlh_tourism/utils/models/clinic_solo_model.dart';
import '../../../../utils/models/clinic_model.dart';
import '../trends/clinics_trending/components/product_images.dart';

class CProductImages extends StatefulWidget {
  const CProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ClinicModelItems product;

  @override
  _CProductImagesState createState() => _CProductImagesState();
}

class _CProductImagesState extends State<CProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return widget.product.imageUrls!.isNotEmpty
        ? Column(
            children: [
              SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: 1,
                  child:
                      Image.network(widget.product.imageUrls![selectedImage]),
                ),
              ),
              // SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    widget.product.imageUrls!.length,
                    (index) => SmallProductImage(
                      isSelected: index == selectedImage,
                      press: () {
                        setState(() {
                          selectedImage = index;
                        });
                      },
                      image: widget.product.imageUrls![index],
                    ),
                  ),
                ],
              )
            ],
          )
        : Column(
            children: [
              SizedBox(
                width: 538,
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Image.asset("assets/images/clinics/clinic1.jpg",
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    1,
                    (index) => SmallProductImage(
                      isSelected: index == selectedImage,
                      press: () {
                        setState(() {
                          selectedImage = index;
                        });
                      },
                      image: "assets/images/clinics/clinic2.jpg",
                    ),
                  ),
                ],
              )
            ],
          );
  }
}

class CSoloProductImages extends StatefulWidget {
  const CSoloProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ClinicSoloData product;

  @override
  _CSoloProductImagesState createState() => _CSoloProductImagesState();
}

class _CSoloProductImagesState extends State<CSoloProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return widget.product.imageUrls!.isNotEmpty
        ? Column(
            children: [
              SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: 1,
                  child:
                      Image.network(widget.product.imageUrls![selectedImage]),
                ),
              ),
              // SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    widget.product.imageUrls!.length,
                    (index) => SmallProductImage(
                      isSelected: index == selectedImage,
                      press: () {
                        setState(() {
                          selectedImage = index;
                        });
                      },
                      image: widget.product.imageUrls![index],
                    ),
                  ),
                ],
              )
            ],
          )
        : Column(
            children: [
              SizedBox(
                width: 538,
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Image.asset("assets/images/clinics/clinic1.jpg",
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    1,
                    (index) => SmallProductImage(
                      isSelected: index == selectedImage,
                      press: () {
                        setState(() {
                          selectedImage = index;
                        });
                      },
                      image: "assets/images/clinics/clinic2.jpg",
                    ),
                  ),
                ],
              )
            ],
          );
  }
}
