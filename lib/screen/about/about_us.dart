import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_alsafa/components/widget/appbar.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/screen/about/cards.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSecond(title: 'About Us'),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),

              SvgPicture.asset('assets/svg/logo2.svg', height: 80.h),
              SizedBox(height: 20.h),
              Text(
                'Taj AL Safa Real Estate Development was established in Amman in 2014 by industry specialists with more than 20 years of expertise in the real estate business.',
                style: AppTextStyles.secondaryStyle,
              ),
              SizedBox(height: 10.h),

              Text(
                'We provide our customers with a diverse choice of outstanding high-end residential and commercial projects. We also offer our clients a unique array of services and professional guidance to assist them in making the finest property decisions.',
                style: AppTextStyles.smallStyle,
              ),
              Text(
                "We embrace change and constantly challenge tradition because we strongly desire to improve the construction method and raise the efficiency and quality of our projects to meet customer's needs, requirements, and well-being.",
                style: AppTextStyles.smallStyle,
              ),
              SizedBox(height: 40.h),
              ListCards(),
            ],
          ),
        ),
      ),
    );
  }
}
