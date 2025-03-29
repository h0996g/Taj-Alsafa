import 'package:hive/hive.dart';

part 'user_mode.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? password;

  @HiveField(4)
  final String? profileImagePath;

  @HiveField(5)
  final String? contactNumber;

  @HiveField(6)
  final String? alternateContactNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.profileImagePath,
    required this.contactNumber,
    required this.alternateContactNumber,
  });

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, password: $password, profileImagePath: $profileImagePath, contactNumber: $contactNumber, alternateContactNumber: $alternateContactNumber}';
  }
}
