import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/appbar.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSecond(title: 'Contact Us'),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              width: double.infinity,
              color: appbar,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      'assets/svg/logo2.svg',
                      fit: BoxFit.none,
                      // height: 40.h,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text('Phone Number', style: AppTextStyles.secondaryStyle),
                  SizedBox(height: 5.h),
                  Text(
                    '00962799263003',
                    style: AppTextStyles.secondaryStyle.copyWith(
                      color: primaryColor,
                      fontFamily: 'ABeeZee',
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Divider(),
                  SizedBox(height: 5.h),
                  Text('Site', style: AppTextStyles.secondaryStyle),
                  SizedBox(height: 5.h),
                  Text(
                    'Prince Rashid District, King Abdullah \nStreet next to Zain, Amman, Jordan',
                    style: AppTextStyles.secondaryStyle.copyWith(
                      color: primaryColor,
                      fontFamily: 'ABeeZee',
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Divider(),
                  SizedBox(height: 5.h),
                  Text('E-mail', style: AppTextStyles.secondaryStyle),
                  SizedBox(height: 5.h),
                  Text(
                    'info@tajalsafa.com',
                    style: AppTextStyles.secondaryStyle.copyWith(
                      color: primaryColor,
                      fontFamily: 'ABeeZee',
                    ),
                  ),
                  SizedBox(height: 4.h),

                  Divider(),
                  SizedBox(height: 5.h),
                  Text('Follow Us', style: AppTextStyles.secondaryStyle),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Image.asset('assets/images/media/twitter.png'),
                      SizedBox(width: 18.w),

                      Image.asset('assets/images/media/facebook.png'),
                      SizedBox(width: 18.w),
                      Image.asset('assets/images/media/youtube.png'),
                      SizedBox(width: 18.w),
                      Image.asset('assets/images/media/instagram.png'),
                      SizedBox(width: 18.w),
                      Image.asset('assets/images/media/linkdin.png'),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Divider(),
                  SizedBox(height: 5.h),
                  Text('Website', style: AppTextStyles.secondaryStyle),
                  SizedBox(height: 5.h),
                  Text(
                    'www.Tajalsafa.com',
                    style: AppTextStyles.secondaryStyle.copyWith(
                      color: primaryColor,
                      fontFamily: 'ABeeZee',
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Divider(),
                  SizedBox(height: 5.h),
                  Text('Your Suggestions', style: AppTextStyles.secondaryStyle),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 26.h,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                              ), // reduce side margins
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              backgroundColor: Colors.white,
                              child: Container(
                                width: double.infinity,
                                height: 320.h,
                                padding: EdgeInsets.all(16.dg),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                  ),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          'Your Suggestions',
                                          style: AppTextStyles.secondaryStyle,
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: appbar,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Write Here ...',
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.all(
                                                16.dg,
                                              ),
                                            ),
                                            maxLines: null,
                                            expands: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      CustomSubmitButton(
                                        text: 'Send',
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appbar,
                        foregroundColor: Colors.transparent,
                        elevation: 0, // Optional if you don’t want shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 26.h,
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Spacer(),
                                Icon(Icons.arrow_forward, color: Colors.black),
                                SizedBox(width: 5.w),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 4.h, // Height of the dark bottom part
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(133, 127, 127, 1),
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
