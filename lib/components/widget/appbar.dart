import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';

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
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,

      centerTitle: true,
      backgroundColor: appbar,
      title: Center(
        child: SvgPicture.asset('assets/svg/logo2.svg', height: 40.h),
      ),
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: Icon(Icons.menu, size: 28.sp),
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
            offset: const Offset(-4, 4),
            largeSize: 10,
            child: Icon(Icons.notifications, size: 28.sp),
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
  Size get preferredSize => Size.fromHeight(40.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,

      centerTitle: true,
      backgroundColor: appbar,
      title: Text(
        title,
        style: AppTextStyles.secondaryStyle.copyWith(
          fontWeight: FontWeight.w300,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 28.sp),
      ),
    );
  }
}
