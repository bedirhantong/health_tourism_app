import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heatlh_tourism/new/main/home/trends/trends_screen.dart';
import '../../../core/model/product_category.dart';
import '../../../view/comman_components/appbar/primary_appbar.dart';
import '../../home_clinics_screen/clinic_screen.dart';
import '../../home_hotels_screen/HomeHotelsScreen.dart';
import 'components/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required int initIndex});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategory = 0;
  List<Widget> _categoryPages = [
    TrendScreen(),
    ClinicScreen(),
    HotelsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20.w),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: productCategories[index].name,
                    onTap: () {
                      setState(() {
                        _selectedCategory = index;
                      });
                    },
                    isSelected: _selectedCategory == index,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 6.75.w),
                itemCount: productCategories.length,
              ),
            ),
            SizedBox(height: 15.h),
            _categoryPages[_selectedCategory],
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
