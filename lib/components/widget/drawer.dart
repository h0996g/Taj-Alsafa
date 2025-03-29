import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_alsafa/components/componants.dart';
import 'package:taj_alsafa/const/colors.dart';
import 'package:taj_alsafa/const/text_style.dart';
import 'package:taj_alsafa/documents/document_page.dart';
import 'package:taj_alsafa/screen/Auth/Login/cubit/login_cubit.dart';
import 'package:taj_alsafa/screen/Auth/Login/login.dart';
import 'package:taj_alsafa/screen/RealState/real_state_info.dart';
import 'package:taj_alsafa/screen/about/about_us.dart';
import 'package:taj_alsafa/screen/contact/contact_us.dart';
import 'package:taj_alsafa/screen/home/cubit/home_cubit.dart';
import 'package:taj_alsafa/screen/profile/edite/info/edite_info.dart';
import 'package:taj_alsafa/screen/terms_conditions/terms_conditions.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // -- HEADER SECTION --
          Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/drawer/header.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  primaryColor,
                  BlendMode.hardLight,
                ),
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // -- AVATAR + EDIT ICON (STACK) --
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (HomeCubit.get(context).userModel == null) {
                          return const CircularProgressIndicator();
                        }
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: primaryColor,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
                                backgroundImage: AssetImage(
                                  'assets/images/drawer/Sample_User_Icon.png',
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
                                    onTap: () {
                                      navigatAndReturn(
                                        context: context,
                                        page: EditeProfile(),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      size: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    // -- USER NAME --
                    Text(
                      HomeCubit.get(context).userModel!.name ?? '',
                      style: AppTextStyles.smallStyle.copyWith(
                        color: Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          // -- DRAWER MENU ITEMS --
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 10),
              children: [
                _buildDrawerItem(
                  title: "About Us",
                  onTap: () {
                    navigatAndReturn(context: context, page: AboutUs());
                  },
                ),
                _buildDrawerItem(
                  title: "Property Info",
                  onTap:
                      () => navigatAndReturn(
                        context: context,
                        page: RealStateInfo(),
                      ),
                ),
                _buildDrawerItem(
                  title: "Terms And Conditions",
                  onTap:
                      () => navigatAndReturn(
                        context: context,
                        page: TermsConditions(),
                      ),
                ),

                // -- CUSTOM DIVIDER --
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Divider(
                    color: Colors.grey,
                    indent: 1,
                    endIndent: 200,
                    thickness: 1.0,
                  ),
                ),

                _buildDrawerItem(
                  title: "Contact Us",
                  onTap:
                      () =>
                          navigatAndReturn(context: context, page: ContactUs()),
                ),
                _buildDrawerItem(
                  title: "My documents",
                  onTap: () {
                    navigatAndReturn(context: context, page: MyDocumentsPage());
                    // Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  title: "Log Out",
                  onTap: () {
                    HomeCubit.get(context).logout();
                    navigatAndFinish(
                      context: context,
                      page: BlocProvider(
                        create: (context) => LoginCubit(),
                        child: Login(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// A helper method to build each drawer item
  Widget _buildDrawerItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      trailing: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: backgroundColor),
        ),
        child: Icon(Icons.arrow_forward_ios, size: 14, color: backgroundColor),
      ),
      onTap: onTap,
    );
  }
}
