import 'package:flutter/material.dart';
import '../../../utils/constants/app/color_strings.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        "Home",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      elevation: 10,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
