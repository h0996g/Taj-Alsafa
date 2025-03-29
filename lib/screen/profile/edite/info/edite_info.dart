import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  HomeCubit? homeCubit;

  File? _selectedImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _alternateContactNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    homeCubit = HomeCubit.get(context);
    _nameController.text = homeCubit!.userModel?.name ?? '';
    _contactNumberController.text = homeCubit!.userModel?.contactNumber ?? '';
    _alternateContactNumberController.text =
        homeCubit!.userModel?.alternateContactNumber ?? '';
    _emailController.text = homeCubit!.userModel?.email ?? '';

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactNumberController.dispose();
    _alternateContactNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 85);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

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
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is UpdateUserInfoSuccessState) {
              homeCubit!.getUserInfo();
              showToast(
                msg: 'Profile updated successfully',
                state: ToastStates.success,
              );

              Navigator.pop(context);
            } else if (state is UpdateUserInfoErrorState) {
              showToast(msg: state.errorMessage, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return CustomSubmitButton(
              text: 'Save Change',
              textColor: Colors.white,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  homeCubit!.updateUserInfo(
                    name: _nameController.text,
                    contactNumber: _contactNumberController.text,
                    alternateContactNumber:
                        _alternateContactNumberController.text,
                    email: _emailController.text,
                    profileImage: _selectedImage,
                  );
                }
              },
            );
          },
        ),
      ),
      appBar: CustomAppBarSecond(title: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
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
                CustomTextField(
                  hintText: 'Full Name',
                  controller: _nameController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Name must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                CustomTextField(
                  hintText: 'Contact Number',
                  controller: _contactNumberController,
                ),
                SizedBox(height: 15.h),

                CustomTextField(
                  hintText: 'Alternate Contact Number',
                  controller: _alternateContactNumberController,
                ),
                SizedBox(height: 15.h),

                CustomTextField(
                  hintText: 'Email Address',
                  controller: _emailController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Email must not be empty';
                    }
                    if (!p0.contains('@') || !p0.contains('.')) {
                      return 'Invalid email address';
                    }
                    return null;
                  },
                ),
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
        ),
      ),
    );
  }
}
