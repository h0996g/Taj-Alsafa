import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/avatar.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/screen/Auth/Login/login.dart';
import 'package:taj_alsafa/screen/home/home.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100.h),

                SizedBox(height: 20.h),
                Text('Sign Up', style: AppTextStyles.imeenStyle),
                SizedBox(height: 20.h),
                const ProfileAvatar(),
                SizedBox(height: 30.h),

                CustomTextField(hintText: 'User Name'),
                SizedBox(height: 10.h),
                CustomTextField(hintText: 'Email'),
                SizedBox(height: 10.h),
                CustomTextField(hintText: 'Password'),
                SizedBox(height: 10.h),
                CustomTextField(hintText: 'Confirm Password'),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Already have an account? Sign In',
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomSubmitButton(
                  haveBorder: true,
                  text: 'Sign Up',
                  onPressed: () {
                    navigatAndFinish(context: context, page: HomePage());
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
