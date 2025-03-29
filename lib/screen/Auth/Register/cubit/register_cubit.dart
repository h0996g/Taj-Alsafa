import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/hive/user/user_mode.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  File? profileImage;

  Future<void> pickProfileImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImageSelected());
    }
  }

  Future<void> saveUserInfo() async {
    emit(RegisterLoadingState());
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;

    // Get the Hive box. Make sure Hive.initHive() has been called before.
    final Box<UserModel> userBox = Hive.box<UserModel>(usersConst);

    // Check if a user with the same name or email already exists.
    bool isNameTaken = userBox.values.any(
      (user) => user.name?.toLowerCase() == name.toLowerCase(),
    );
    bool isEmailTaken = userBox.values.any(
      (user) => user.email?.toLowerCase() == email.toLowerCase(),
    );

    if (isNameTaken || isEmailTaken) {
      String errorMessage = '';
      if (isNameTaken) {
        errorMessage += 'Username is already taken. ';
      }
      if (isEmailTaken) {
        errorMessage += 'Email is already registered.';
      }
      emit(UserAlreadyExistsErrorState(errorMessage));
      return;
    }

    // Create a UserModel instance.
    final user = UserModel(
      name: name,
      email: email,
      password: password,
      profileImagePath: profileImage?.path,
    );

    // Save the user to the box.
    await userBox.add(user);

    // Emit a state indicating the user info was saved successfully.
    emit(UserInfoSaved());
  }
}
