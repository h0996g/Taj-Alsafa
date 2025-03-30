import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/appbar.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/screen/home/cubit/home_cubit.dart';

class EditePassword extends StatefulWidget {
  const EditePassword({super.key});

  @override
  State<EditePassword> createState() => _EditePasswordState();
}

class _EditePasswordState extends State<EditePassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            if (state is UpdateUserPasswordSuccessState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check,
                          color: Color.fromRGBO(127, 209, 174, 1),
                          size: 100,
                        ),
                        Text(
                          'Password Changed\nSuccessfully',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.imeenStyle,
                        ),
                      ],
                    ),
                  );
                },
              );
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
            } else if (state is UpdateUserPasswordErrorState) {
              showToast(msg: state.errorMessage, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return CustomSubmitButton(
              isLoading: state is UpdateUserPasswordLoadingState,
              text: 'Change Password',
              textColor: Colors.white,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  HomeCubit.get(context).updateUserPassword(
                    currentPassword: currentPasswordController.text,
                    newPassword: newPasswordController.text,
                  );
                }
              },
            );
          },
        ),
      ),

      appBar: CustomAppBarSecond(title: 'Change Password'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomTextField(
                isPasswordEdite: true,

                hintText: 'Current Password',
                controller: currentPasswordController,
                obscureText: true,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                isPasswordEdite: true,
                obscureText: true,
                hintText: 'New Password',
                controller: newPasswordController,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                isPasswordEdite: true,
                obscureText: true,
                hintText: 'Confirm New Password',
                controller: confirmNewPasswordController,
                textInputAction: TextInputAction.done,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please confirm your new password';
                  }
                  if (p0 != newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
