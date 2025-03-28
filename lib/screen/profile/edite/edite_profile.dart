import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/colors.dart';

class EditeProfile extends StatelessWidget {
  const EditeProfile({super.key});

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
          text: 'Save Change',
          textColor: Colors.white,
          onPressed: () {
            // navigatAndFinish(context: context, page: HomePage());
          },
        ),
      ),
      appBar: AppBar(
        title: Text('Edite Profile'),
        backgroundColor: appbar,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: primaryColor,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/drawer/Ellipse.png',
                    ),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  right: 10,
                  child: Material(
                    elevation: 4,
                    shape: const CircleBorder(),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.upload,
                          size: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            CustomTextField(hintText: 'Full Name'),
            SizedBox(height: 15.h),
            CustomTextField(hintText: 'Contact Number'),
            SizedBox(height: 15.h),

            CustomTextField(hintText: 'Alternate Contact Number'),
            SizedBox(height: 15.h),

            CustomTextField(hintText: 'Email Address'),
            SizedBox(height: 30.h),
            CustomSubmitButton(
              textColor: Colors.white,
              text: 'Change Password',

              onPressed: () {
                // navigatAndFinish(context: context, page: HomePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
