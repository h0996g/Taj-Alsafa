import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/hive/BD/hive.dart';
import 'package:taj_alsafa/screen/Auth/Login/cubit/login_cubit.dart';
import 'package:taj_alsafa/screen/Auth/Login/forget_pass/forget_pass.dart';
import 'package:taj_alsafa/screen/Auth/Login/functions.dart';
import 'package:taj_alsafa/screen/Auth/Register/cubit/register_cubit.dart';
import 'package:taj_alsafa/screen/Auth/Register/register.dart';
import 'package:taj_alsafa/screen/home/cubit/home_cubit.dart';
import 'package:taj_alsafa/screen/home/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Form(
            key: LoginCubit.get(context).formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Sign In', style: AppTextStyles.imeenStyle),
                SizedBox(height: 30.h),

                CustomTextField(
                  hintText: 'User Name',
                  controller: LoginCubit.get(context).nameController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),

                CustomTextField(
                  obscureText: true,
                  hintText: 'Password',
                  controller: LoginCubit.get(context).passwordController,
                  textInputAction: TextInputAction.done,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),

                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          navigatAndReturn(
                            context: context,
                            page: ForgetPass(),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Forget Password',
                            style: AppTextStyles.smallStyle,
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
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => BlocProvider(
                                  create: (context) => RegisterCubit(),
                                  child: const RegisterPage(),
                                ),
                          ),
                        );
                      },
                      child: Text('Sign Up', style: AppTextStyles.smallStyle),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is AuthenticationNotEmptyState) {
                      showAccountsDialog(state.userBox, context);
                    }
                    if (state is LoginSuccessState) {
                      HiveDB.saveUserId(state.userId);
                      HomeCubit.get(context).getUserInfo();
                      navigatAndFinish(context: context, page: HomePage());
                      showToast(
                        msg: 'Login Success',
                        state: ToastStates.success,
                      );
                    } else if (state is LoginErrorState) {
                      showToast(
                        msg: state.errorMessage,
                        state: ToastStates.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomSubmitButton(
                      haveBorder: true,
                      text: 'Sign In',
                      isLoading: state is LoginLoadingState,
                      onPressed: () {
                        if (LoginCubit.get(
                          context,
                        ).formKey.currentState!.validate()) {
                          LoginCubit.get(context).loginUser();
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 20.h),

                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final cubit = LoginCubit.get(context);

                    if (cubit.supportState && cubit.biometricType != null) {
                      return Column(
                        children: [
                          Text(
                            'Login with biometric',
                            style: AppTextStyles.smallStyle,
                          ),
                          IconButton(
                            onPressed: cubit.loginWithFingerprint,
                            icon: Icon(
                              cubit.biometricType == BiometricType.face
                                  ? Icons.face
                                  : Icons.fingerprint,
                              color: Colors.black,
                              size: 40.h,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
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
