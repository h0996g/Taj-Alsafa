import 'package:hive_flutter/hive_flutter.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/hive/user/user_mode.dart';

class HiveDB {
  static const String _infoBox = usersConst;
  static const String _authBox = authBoxConst;

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());

    // Open user and auth boxes
    await Hive.openBox<UserModel>(_infoBox);
    await Hive.openBox(_authBox);
  }

  /// Save user ID
  static void saveUserId(String id) {
    final box = Hive.box(_authBox);
    userIdConst = id;
    box.put('userId', id);
  }

  /// Get user ID
  static String? getUserId() {
    final box = Hive.box(_authBox);
    return box.get('userId');
  }

  static void removeUserId() {
    final box = Hive.box(_authBox);
    userIdConst = null;
    box.delete('userId');
  }

  /// Check if logged in
  static bool isLoggedIn() {
    final box = Hive.box(_authBox);
    return box.containsKey('userId');
  }
}
