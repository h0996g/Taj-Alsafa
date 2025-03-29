import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/components/widget/avatar.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/screen/Auth/Login/login.dart';
import 'package:taj_alsafa/screen/Auth/Register/cubit/register_cubit.dart';
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
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'Email',
                    controller: RegisterCubit.get(context).emailController,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'Password',
                    controller: RegisterCubit.get(context).passwordController,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    hintText: 'Confirm Password',
                    controller:
                        RegisterCubit.get(context).confirmPasswordController,
                  ),
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
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is UserInfoSaved) {
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
