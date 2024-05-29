import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heatlh_tourism/utils/constants/app/color_strings.dart';
import '../../../../../utils/models/clinic_model.dart';

class PopularClinicCard extends StatelessWidget {
  const PopularClinicCard({
    Key? key,
    this.width = 160,
    this.aspectRtio = 1.2,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width;
  final double aspectRtio;
  final ClinicModelItems product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: aspectRtio,
                  child: product.imageUrls!.isEmpty
                      ? Image.asset(
                          "assets/images/clinics/clinic7.jpg",
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          product.imageUrls![0],
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Positioned(
                bottom: 8.0,
                right: 8.0,
                child: InkWell(
                  onTap: () => _showMapBottomSheet(context, product),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.map,
                      size: 24,
                      color: AppColor.kPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMapBottomSheet(BuildContext context, ClinicModelItems product) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(product.latitude!, product.longitude!),
                  zoom: 15.0,
                ),
                markers: {product.toMarker()},
              ),
              Positioned(
                top: 16.0,
                left: 16.0,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
