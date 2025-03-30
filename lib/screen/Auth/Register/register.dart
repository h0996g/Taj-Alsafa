import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/avatar.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/hive/BD/hive.dart';

import 'package:taj_alsafa/screen/Auth/Register/cubit/register_cubit.dart';
import 'package:taj_alsafa/screen/home/cubit/home_cubit.dart';
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
            child: Form(
              key: RegisterCubit.get(context).formKey,
              child: Column(
                children: [
                  SizedBox(height: 100.h),

                  SizedBox(height: 20.h),
                  Text('Sign Up', style: AppTextStyles.imeenStyle),
                  SizedBox(height: 20.h),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    buildWhen:
                        (previous, current) => current is ProfileImageSelected,
                    builder: (context, state) {
                      return ProfileAvatar(
                        imageFile: RegisterCubit.get(context).profileImage,
                        onImagePicked:
                            RegisterCubit.get(context).pickProfileImage,
                      );
                    },
                  ),
                  SizedBox(height: 30.h),

                  CustomTextField(
                    hintText: 'User Name',
                    controller: RegisterCubit.get(context).nameController,

                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'Email',
                    controller: RegisterCubit.get(context).emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!p0.contains('@') || !p0.contains('.')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'Password',
                    controller: RegisterCubit.get(context).passwordController,
                    obscureText: true,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'Confirm Password',
                    textInputAction: TextInputAction.done,
                    controller:
                        RegisterCubit.get(context).confirmPasswordController,
                    obscureText: true,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (p0 !=
                          RegisterCubit.get(context).passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Already have an account? Sign In',
                            style: AppTextStyles.smallStyle,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is UserInfoSaved) {
                        HiveDB.saveUserId(state.userId);
                        HomeCubit.get(context).getUserInfo();
                        navigatAndFinish(context: context, page: HomePage());
                      } else if (state is UserAlreadyExistsErrorState) {
                        showToast(
                          msg: state.errorMessage,
                          state: ToastStates.error,
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomSubmitButton(
                        isLoading: state is RegisterLoadingState,

                        haveBorder: true,
                        text: 'Sign Up',
                        onPressed: () {
                          if (RegisterCubit.get(
                            context,
                          ).formKey.currentState!.validate()) {
                            RegisterCubit.get(context).saveUserInfo();
                          }
                        },
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
