import 'package:heatlh_tourism/core/model/offer_model.dart';

class UserModel {
  String id;
  String userName;
  String firstName;
  String lastName;
  String password;
  String userImage;
  String? email;
  String? dateOfBirth;
  bool isPremium;
  List<OfferModel> favoriteOffers;
  List<OfferModel> paidOffers;

  UserModel({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.email,
    this.dateOfBirth,
    this.isPremium = false,
    required this.favoriteOffers,
    required this.paidOffers,
  });
}
