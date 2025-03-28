import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/const/text_style.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: backgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Please Enter Your Email To Retrieve Your Password.',
                    style: AppTextStyles.smallStyle,
                  ),
                  SizedBox(height: 30.h),
                  CustomTextField(hintText: 'Email'),

                  SizedBox(height: 50.h),
                  CustomSubmitButton(
                    haveBorder: true,
                    text: 'Recover Password',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60.h,
            left: 20.w,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 25.sp),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
