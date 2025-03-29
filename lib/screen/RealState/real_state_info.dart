import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/appbar.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';

class RealStateInfo extends StatelessWidget {
  const RealStateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSecond(title: 'Real State Info'),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              width: double.infinity,
              color: appbar,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomDropdownMenu<String>(
                      hintText: '',
                      value: "Abdoun Project - Phase 1",
                      onChanged: (value) {},
                      items:
                          [
                            'Abdoun Project - Phase 1',
                            'Abdoun Project - Phase 2',
                            'Abdoun Project - VIP Area',
                          ].map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 3,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      spacing: 5.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Property Address: Abdoun ',
                          style: AppTextStyles.smallStyle,
                        ),
                        Text(
                          'Property Type: Villa',
                          style: AppTextStyles.smallStyle,
                        ),
                        Text(
                          'Property Area: 200 M',
                          style: AppTextStyles.smallStyle,
                        ),
                        Text(
                          'Purchase Date: 22 / 5 / 2025',
                          style: AppTextStyles.smallStyle,
                        ),
                        Text(
                          'Warranty Expiration Date: 22 / 5 / 2026',
                          style: AppTextStyles.smallStyle,
                        ),
                        Text(
                          'Year Of Property Construction: 2026',
                          style: AppTextStyles.smallStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Plan', style: AppTextStyles.secondaryStyle),
                  SizedBox(height: 10.h),
                  CustomSubmitButton(
                    width: double.infinity,
                    icon: SvgPicture.asset('assets/svg/Pdf.svg'),
                    text: 'View File',
                    onPressed: () {},
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    'Profiles And Presentations',
                    style: AppTextStyles.secondaryStyle,
                  ),
                  SizedBox(height: 10.h),
                  CustomSubmitButton(
                    width: double.infinity,
                    icon: SvgPicture.asset('assets/svg/Pdf.svg'),
                    text: 'View File',
                    onPressed: () {},
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Images', style: AppTextStyles.secondaryStyle),

                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 180.h,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/home/Slider2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<DropdownMenuItem<String>> abdounItems = [
  DropdownMenuItem(value: 'phase_1', child: Text('Abdoun Project - Phase 1')),
  DropdownMenuItem(value: 'phase_2', child: Text('Abdoun Project - Phase 2')),
  DropdownMenuItem(value: 'vip_area', child: Text('Abdoun Project - VIP Area')),
];
