import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/drawer.dart';
import 'package:taj_alsafa/const/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerPage(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appbar,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo/logo.png'),
            SizedBox(height: 10),
          ],
        ),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              label: Text('3', style: TextStyle(color: Colors.black)),
              backgroundColor: thirdColor,
              child: Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 20.h),
            SizedBox(
              height: 180.h,
              width: double.infinity,
              child: Image.asset(
                'assets/images/home/Slider.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Text('Choose Your Requirement'),
                  SizedBox(height: 20.h),
                  Text(
                    'typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus .',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50.h),
                  CustomSubmitButton(
                    text: 'My Tickets',
                    onPressed: () {},
                    color: secondButtonColor,
                  ),
                  CustomSubmitButton(
                    text: 'My Request',
                    onPressed: () {},
                    color: secondButtonColor,
                  ),
                  CustomSubmitButton(
                    text: 'Handing Over',
                    onPressed: () {},
                    color: secondButtonColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
