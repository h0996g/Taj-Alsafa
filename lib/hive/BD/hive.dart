import 'package:hive_flutter/hive_flutter.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/hive/user/user_mode.dart';

class HiveDB {
  static const String _infoBox = usersConst;

  static Future<void> initHive() async {
    // Initialize Hive for Flutter.
    await Hive.initFlutter();

    // Register the adapter generated for UserModel.
    Hive.registerAdapter(UserModelAdapter());

    // Open a Hive box to store UserModel instances.
    await Hive.openBox<UserModel>(_infoBox);
  }
}
