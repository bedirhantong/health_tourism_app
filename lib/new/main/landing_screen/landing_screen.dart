import 'package:flutter/material.dart';
import '../../../utils/constants/app/color_strings.dart';
import '../../../view/onboarding/components/bottom_navbar.dart';
import '../../../view/search/search_page.dart';
import '../home/home_page.dart';
import '../map_screen/map_screen.dart';

class BottomNavMain extends StatefulWidget {
  const BottomNavMain({
    super.key,
    this.function,
    required this.initIndex,
  });

  final VoidCallback? function;
  final int initIndex;

  @override
  State<BottomNavMain> createState() => _BottomNavMainState();
}

class _BottomNavMainState extends State<BottomNavMain> {
  int _currentIndex = 0;
  bool _isBottomNavBarVisible = true;

  @override
  void initState() {
    super.initState();
    widget.function?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBody(),
          Positioned(
            left: 0,
            right: 0,
            bottom: _isBottomNavBarVisible ? -2 : 16,
            child: Center(
              child: ClipRect(
                child: FloatingActionButton(
                  isExtended: true,
                  backgroundColor: Colors.white,
                  mini: true,
                  onPressed: () {
                    setState(() {
                      _isBottomNavBarVisible = !_isBottomNavBarVisible;
                    });
                  },
                  child: Icon(
                    color: AppColor.kBGColor,
                    _isBottomNavBarVisible
                        ? Icons.keyboard_arrow_down_outlined
                        : Icons.keyboard_arrow_up_outlined,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _isBottomNavBarVisible
          ? BottomNavBarCustomized(
              currentIndex: _currentIndex,
              onIndexChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              initIndex: widget.initIndex,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return HomePage(
          initIndex: widget.initIndex,
        );
      case 1:
        return SearchPage();
      case 2:
        return MapScreen();
      default:
        return const SizedBox.shrink();
    }
  }
}
