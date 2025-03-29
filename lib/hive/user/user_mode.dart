import 'package:hive/hive.dart';

part 'user_mode.g.dart'; // This tells build_runner where to generate the adapter.

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  // Although confirmPassword is typically used only for validation,
  // it’s included here per your requirement.
  @HiveField(3)
  final String confirmPassword;

  // Instead of storing a File directly, we store the file path.
  @HiveField(4)
  final String? profileImagePath;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.profileImagePath,
  });
}
