import '../../utils/constants/app/image_strings.dart';

class OnBoarding {
  String title;
  String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> pageViewList = [
  OnBoarding(
    title: 'Welcome to new Journey, are you ready to see the new opportunities',
    image: ImagesPath.onboardingWelcome,
  ),
  OnBoarding(
    title:
        'Be healthy with having fun, by using H&T it will be easy and enjoyable to be healthy, more than ever',
    image: ImagesPath.onboardingSecond,
  ),
  OnBoarding(
    title: "Health Tourism\n brand new health&tourism app",
    image: ImagesPath.onboardingTeam,
  ),
];
