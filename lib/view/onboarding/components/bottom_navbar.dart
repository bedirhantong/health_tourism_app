import 'package:flutter/material.dart';
import 'package:heatlh_tourism/utils/constants/app/color_strings.dart';

class BottomNavBarCustomized extends StatefulWidget {
  const BottomNavBarCustomized({
    Key? key,
    required this.currentIndex,
    required this.onIndexChanged,
    required this.initIndex,
  }) : super(key: key);
  final int initIndex;
  final int currentIndex;
  final ValueChanged<int> onIndexChanged;

  @override
  State<BottomNavBarCustomized> createState() => _BottomNavBarCustomizedState();
}

class _BottomNavBarCustomizedState extends State<BottomNavBarCustomized> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      // backgroundColor: AppColor.kBackground,
      onDestinationSelected: (int index) {
        widget.onIndexChanged(index);
      },
      indicatorColor: Colors.blue,
      selectedIndex: widget.currentIndex,
      elevation: 10,
      animationDuration: Duration(milliseconds: 1700),
      destinations: List.generate(
        3,
        (index) => _buildNavigationDestination(
          index,
          index == widget.currentIndex,
        ),
      ),
    );
  }

  Widget _buildNavigationDestination(int index, bool isSelected) {
    return NavigationDestination(
      selectedIcon: Icon(
        _getIconData(index),
        color: Colors.white,
      ),
      icon: Icon(
        _getIconData(index),
      ),
      label: _getLabel(index),
    );
  }

  IconData _getIconData(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.search_outlined;
      case 2:
        return Icons.map;
      // case 3:
      //   return Icons.favorite_outline_outlined;
      // case 4:
      //   return Icons.settings_outlined;
      default:
        return Icons.home_outlined;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Map';
      // case 3:
      //   return 'Favorite';
      // case 4:
      //   return 'Settings';
      default:
        return 'Home';
    }
  }
}
