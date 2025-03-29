import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/hive/BD/hive.dart';
import 'package:taj_alsafa/hive/user/user_mode.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  void logout() {
    HiveDB.removeUserId();
    userModel = null;
  }

  UserModel? userModel;
  void getUserInfo() {
    emit(UserInfoLoadingState());

    final Box<UserModel> userBox = Hive.box<UserModel>(usersConst);

    try {
      userModel = userBox.values.firstWhere((user) => user.id == userIdConst);

      emit(UserInfoSuccessState());
    } catch (e) {
      emit(UserInfoErrorState("Something went wrong: $e"));
    }
  }

  void updateUserInfo({
    required String name,
    required String contactNumber,
    required String alternateContactNumber,
    required String email,
    required File? profileImage,
  }) {
    emit(UserInfoLoadingState());

    final Box<UserModel> userBox = Hive.box<UserModel>(usersConst);

    try {
      final userEntry = userBox.toMap().entries.firstWhere(
        (entry) => entry.value.id == userIdConst,
      );

      final key = userEntry.key;

      UserModel updatedUser = UserModel(
        id: userIdConst!,
        name: name,
        email: email,
        password: userModel!.password,
        profileImagePath: profileImage?.path ?? userModel!.profileImagePath,
        contactNumber: contactNumber,
        alternateContactNumber: alternateContactNumber,
      );

      userBox.put(key, updatedUser);
      userModel = updatedUser;

      emit(UpdateUserInfoSuccessState());
    } catch (e) {
      emit(UpdateUserInfoErrorState("Something went wrong: $e"));
    }
  }
}
