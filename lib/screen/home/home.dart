import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/appbar.dart';
import 'package:taj_alsafa/components/widget/drawer.dart';
import 'package:taj_alsafa/components/widget/slider.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/screen/notification/notification.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.7,
        child: DrawerPage(),
      ),
      appBar: CustomAppBar(
        logoAssetPath: 'assets/images/logo/logo.png',
        notificationCount: 3,
        onNotificationPressed: () {
          navigatAndReturn(context: context, page: NotificationPage());
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: 10.h),
              ImageSlider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Text(
                      'Choose Your Requirement',
                      style: AppTextStyles.smallStyle,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus .',
                      textAlign: TextAlign.start,
                      style: AppTextStyles.smallStyle.copyWith(
                        fontFamily: 'Adamina',
                      ),
                    ),
                    SizedBox(height: 50.h),
                    CustomSubmitButton(
                      text: 'My Tickets',
                      onPressed: () {},
                      color: secondButtonColor,
                    ),
                    SizedBox(height: 5.h),
                    CustomSubmitButton(
                      text: 'My Request',
                      onPressed: () {},
                      color: secondButtonColor,
                    ),
                    SizedBox(height: 5.h),
                    // SizedBox(height: 3.h),
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
      ),
    );
  }
}
