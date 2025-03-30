import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/hive/BD/hive.dart';
import 'package:taj_alsafa/hive/user/user_mode.dart';
import 'package:taj_alsafa/screen/home/cubit/home_cubit.dart';
import 'package:taj_alsafa/screen/home/home.dart';

void showAccountsDialog(List<UserModel> users, BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) {
      return Dialog(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Select Account', style: AppTextStyles.imeenStyle),
              SizedBox(height: 20.h),
              SizedBox(
                height: 300.h,
                child: ListView.separated(
                  itemCount: users.length,
                  shrinkWrap: true,
                  separatorBuilder:
                      (_, __) => Divider(color: Colors.grey.shade300),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        _loginSelectedUser(user, context);
                      },
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 8.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            user.profileImagePath != null
                                ? CircleAvatar(
                                  radius: 24.r,
                                  backgroundColor: Colors.white,
                                  backgroundImage: FileImage(
                                    File(user.profileImagePath!),
                                  ),
                                )
                                : CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 24.r,
                                  child: Icon(
                                    Icons.person,
                                    size: 24.sp,
                                    color: Colors.black,
                                  ),
                                ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name ?? 'No Name',
                                  style: AppTextStyles.smallStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  user.email ?? '',
                                  style: AppTextStyles.smallStyle.copyWith(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _loginSelectedUser(UserModel user, BuildContext context) {
  HiveDB.saveUserId(user.id);
  HomeCubit.get(context).getUserInfo();
  navigatAndFinish(context: context, page: HomePage());

  showToast(msg: 'Logged in as ${user.name}', state: ToastStates.success);
}
