import 'package:flutter/material.dart';
import 'package:heatlh_tourism/utils/models/hotel_solo_model.dart';
import '../../../../utils/models/hotel_model.dart';
import '../trends/clinics_trending/components/product_images.dart';

class HProductImages extends StatefulWidget {
  const HProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final HotelModelItems product;

  @override
  _HProductImagesState createState() => _HProductImagesState();
}

class _HProductImagesState extends State<HProductImages> {
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
                      image: "assets/images/clinics/clinic1.jpg",
                    ),
                  ),
                ],
              )
            ],
          );
  }
}

class HSoloProductImages extends StatefulWidget {
  const HSoloProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final HotelSoloData product;

  @override
  _HSoloProductImagesState createState() => _HSoloProductImagesState();
}

class _HSoloProductImagesState extends State<HSoloProductImages> {
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
                      image: "assets/images/clinics/clinic1.jpg",
                    ),
                  ),
                ],
              )
            ],
          );
  }
}
