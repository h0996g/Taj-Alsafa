import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:taj_alsafa/const/const.dart';
import 'package:taj_alsafa/hive/user/user_mode.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> loginUser() async {
    emit(LoginLoadingState());

    final String enteredUserName = nameController.text;
    final String enteredPassword = passwordController.text;
    final Box<UserModel> userBox = Hive.box<UserModel>(usersConst);
    try {
      UserModel? matchingUser;
      for (var user in userBox.values) {
        if (user.name?.toLowerCase() == enteredUserName.toLowerCase()) {
          matchingUser = user;
          break;
        }
      }

      if (matchingUser?.password != enteredPassword || matchingUser == null) {
        emit(LoginErrorState("Invalid username or password"));
        return;
      }
      emit(LoginSuccessState(matchingUser.id));
    } catch (e) {
      print(e);
      emit(LoginErrorState("Something went wrong: $e"));
    }
  }
}
