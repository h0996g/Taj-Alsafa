import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/helper/observer.dart';
import 'package:taj_alsafa/hive/BD/hive.dart';
import 'package:taj_alsafa/hive/user/user_mode.dart';
import 'package:taj_alsafa/screen/Auth/Login/cubit/login_cubit.dart';
import 'package:taj_alsafa/screen/Auth/Login/login.dart';
import 'package:taj_alsafa/screen/home/cubit/home_cubit.dart';
import 'package:taj_alsafa/them.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  await HiveDB.initHive(); // Initialize Hive and open the "users" box
  userIdConst = HiveDB.getUserId();
  // Print users stored in Hive
  printStoredUsers();

  runApp(const MyApp());
}

/// Reads the "users" box and prints each user's details.
void printStoredUsers() {
  final Box<UserModel> userBox = Hive.box<UserModel>("users");

  if (userBox.isEmpty) {
    print("No users stored in the database.");
  } else {
    print("Stored Users:");
    for (var user in userBox.values) {
      print("Name: ${user.name}, Email: ${user.email}");
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => HomeCubit())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider(create: (context) => LoginCubit(), child: Login()),

          theme: AppThemes.lightTheme,
        ),
      ),
    );
  }
}
