import 'package:flutter/material.dart';
import 'package:heatlh_tourism/utils/models/agency_model.dart';
import 'package:heatlh_tourism/utils/models/agency_solo_model.dart';

class AProductImages extends StatefulWidget {
  const AProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final AgencyItemsModel product;

  @override
  _AProductImagesState createState() => _AProductImagesState();
}

class _AProductImagesState extends State<AProductImages> {
  @override
  Widget build(BuildContext context) {
    return (widget.product.picture == null || widget.product.picture!.isEmpty)
        ? Image.asset(
            "assets/images/clinics/clinic7.jpg",
            fit: BoxFit.cover,
          )
        : Image.network(
            widget.product.picture!,
            fit: BoxFit.cover,
          );

    //
    //
    // widget.product.picture!.isNotEmpty || widget.product.picture != null
    //   ? Column(
    //       children: [
    //         SizedBox(
    //           height: 240,
    //           width: MediaQuery.of(context).size.width,
    //           child: AspectRatio(
    //             aspectRatio: 1,
    //             child: Image.network(widget.product.picture!),
    //           ),
    //         ),
    //       ],
    //     )
    //   : Column(
    //       children: [
    //         SizedBox(
    //           width: 538,
    //           child: AspectRatio(
    //             aspectRatio: 1.3,
    //             child: Image.asset("assets/images/clinics/clinic1.jpg",
    //                 fit: BoxFit.fill),
    //           ),
    //         ),
    //         SizedBox(height: 20),
    //       ],
    //     );
  }
}

class ASoloProductImages extends StatefulWidget {
  const ASoloProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final AgencySoloData product;

  @override
  _ASoloProductImagesState createState() => _ASoloProductImagesState();
}

class _ASoloProductImagesState extends State<ASoloProductImages> {
  @override
  Widget build(BuildContext context) {
    return (widget.product.picture == null || widget.product.picture!.isEmpty)
        ? Image.asset(
            "assets/images/clinics/clinic7.jpg",
            fit: BoxFit.cover,
          )
        : Image.network(
            widget.product.picture!,
            fit: BoxFit.cover,
          );

    //
    //
    // widget.product.picture!.isNotEmpty || widget.product.picture != null
    //   ? Column(
    //       children: [
    //         SizedBox(
    //           height: 240,
    //           width: MediaQuery.of(context).size.width,
    //           child: AspectRatio(
    //             aspectRatio: 1,
    //             child: Image.network(widget.product.picture!),
    //           ),
    //         ),
    //       ],
    //     )
    //   : Column(
    //       children: [
    //         SizedBox(
    //           width: 538,
    //           child: AspectRatio(
    //             aspectRatio: 1.3,
    //             child: Image.asset("assets/images/clinics/clinic1.jpg",
    //                 fit: BoxFit.fill),
    //           ),
    //         ),
    //         SizedBox(height: 20),
    //       ],
    //     );
  }
}
