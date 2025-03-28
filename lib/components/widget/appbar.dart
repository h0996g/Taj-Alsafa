import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_alsafa/const/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int notificationCount;
  final String logoAssetPath;
  final VoidCallback onNotificationPressed;

  const CustomAppBar({
    super.key,
    this.notificationCount = 0,
    required this.logoAssetPath,
    required this.onNotificationPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,

      centerTitle: true,
      backgroundColor: appbar,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/logo2.svg', height: 40.h),
          const SizedBox(height: 5),
        ],
      ),
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
      ),
      actions: [
        IconButton(
          onPressed: onNotificationPressed,
          icon: Badge(
            label: Text(
              notificationCount.toString(),
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: thirdColor,
            child: const Icon(Icons.notifications),
          ),
        ),
      ],
    );
  }
}

class CustomAppBarSecond extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  const CustomAppBarSecond({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,

      centerTitle: true,
      backgroundColor: appbar,
      title: Text(title),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
