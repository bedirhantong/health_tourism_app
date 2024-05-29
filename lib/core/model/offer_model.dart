import 'package:flutter/material.dart';

class OfferModel {
  String id;
  String name;
  List<String> image;
  String description;
  Color? bgCol;
  double price;
  double discountPrice;
  OfferModel({
    required this.id,
    required this.description,
    required this.name,
    required this.image,
    this.bgCol,
    required this.price,
    required this.discountPrice,
  });
}
