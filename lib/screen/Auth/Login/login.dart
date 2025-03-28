import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/screen/Auth/Login/forget_pass/forget_pass.dart';
import 'package:taj_alsafa/screen/home/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Sign In', style: AppTextStyles.imeenStyle),
              SizedBox(height: 30.h),
              CustomTextField(hintText: 'User Name'),

              SizedBox(height: 10.h),
              CustomTextField(hintText: 'Password'),
              SizedBox(height: 10.h),

              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    navigatAndReturn(context: context, page: ForgetPass());
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Forget Password',
                      style: TextStyle(
                        fontSize: 14.0.sp, // your desired font size
                      ),
                      children: [
                        TextSpan(
                          text: ' ؟',
                          style: TextStyle(fontSize: 18.0.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              CustomSubmitButton(
                haveBorder: true,
                text: 'Sign In',
                onPressed: () {
                  navigatAndFinish(context: context, page: HomePage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
