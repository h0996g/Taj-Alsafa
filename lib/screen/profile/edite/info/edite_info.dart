import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/appbar.dart';
import 'package:taj_alsafa/components/widget/avatar.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/screen/home/cubit/home_cubit.dart';
import 'package:taj_alsafa/screen/profile/edite/password/edite_password.dart';

class EditeProfile extends StatefulWidget {
  const EditeProfile({super.key});

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {
  @override
  Widget build(BuildContext context) {
    File? _selectedImage;

    Future<void> _pickImage(ImageSource source) async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    }

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
      appBar: CustomAppBarSecond(title: 'Edit Profile'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            ProfileAvatar(
              imageFile: _selectedImage,
              onImagePicked: _pickImage,
              imageUrl: HomeCubit.get(context).userModel?.profileImagePath,
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
                navigatAndReturn(context: context, page: EditePassword());
              },
            ),
          ],
        ),
      ),
    );
  }
}
