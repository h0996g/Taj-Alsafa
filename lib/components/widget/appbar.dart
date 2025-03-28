import 'package:flutter/material.dart';
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Adjust height as needed

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: appbar,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset(logoAssetPath), const SizedBox(height: 5)],
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Adjust height as needed

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
