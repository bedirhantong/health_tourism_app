import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../new/main/landing_screen/landing_screen.dart';
import '../../utils/constants/app/color_strings.dart';
import '../../core/model/onboarding_model.dart';
import '../comman_components/primarybutton.dart';
import 'components/onboarding_card.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondary,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding:
                EdgeInsets.only(left: 61.65.w, right: 43.75.w, top: 121.76.h),
            child: Image.asset(pageViewList[_currentIndex].image),
          )),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        itemCount: pageViewList.length,
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return OnboardingCard(
                            onBoardingList: pageViewList,
                            currentIndex: index,
                            pageController: pageController,
                          );
                        }))
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding:
            EdgeInsets.only(top: 30.h, left: 32.w, right: 32.w, bottom: 30.h),
        child: PrimaryButton(
          onTap: () async {
            if (_currentIndex == pageViewList.length - 1) {
              // final pres = await SharedPreferences.getInstance();
              // pres.setBool("onboarding", true);
              Get.offAll(
                () => const BottomNavMain(
                  initIndex: 0,
                ),
              );
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //     builder: ((context) => LoginScreen()),
              //   ),
              //   (route) => false,
              // );
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
              );
            }
          },
          text: _currentIndex == pageViewList.length - 1
              ? 'Get Started'
              : 'Continue',
          bgColor: AppColor.kPrimary,
          borderRadius: 8,
          height: 55.h,
          width: 326.w,
          textColor: AppColor.kWhiteColor,
        ),
      ),
    );
  }
}
