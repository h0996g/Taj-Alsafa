import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/screen/Auth/Login/intro.dart';
import 'package:taj_alsafa/screen/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait 2 seconds then navigate with animation
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 2000),
          pageBuilder:
              (_, __, ___) =>
                  userIdConst != null ? const HomePage() : const Intro(),
          transitionsBuilder: (_, animation, __, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: Curves.easeInOut));

            return SlideTransition(
              position: animation.drive(tween),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
                child: child,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SizedBox.expand(
          child: SvgPicture.asset(
            'assets/svg/Layer_1.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
