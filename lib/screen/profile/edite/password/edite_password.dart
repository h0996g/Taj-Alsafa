import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/appbar.dart';
import 'package:taj_alsafa/const/colors.dart';

class EditePassword extends StatelessWidget {
  const EditePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: appbar,

              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: CustomSubmitButton(
          text: 'Change Password',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),

      appBar: CustomAppBarSecond(title: 'Change Password'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            CustomTextField(hintText: 'Current Password'),
            SizedBox(height: 15.h),
            CustomTextField(hintText: 'New Password'),
            SizedBox(height: 15.h),
            CustomTextField(hintText: 'Confirm New Password'),
          ],
        ),
      ),
    );
  }
}
