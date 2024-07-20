import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String)? onSearchChanged;
  final TextEditingController searchController;
  final VoidCallback? onClearPressed;

  const MainScreenAppbar({
    super.key,
    this.onSearchChanged,
    required this.searchController,
    this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Burning Bros Shop"),
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 70.h),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: onSearchChanged,
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: "Search Product",
              suffixIcon: IconButton(
                onPressed: onClearPressed,
                icon: const Icon(CupertinoIcons.xmark),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
