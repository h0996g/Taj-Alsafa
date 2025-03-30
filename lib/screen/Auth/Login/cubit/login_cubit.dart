import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';
import 'package:taj_alsafa/components/componants.dart';
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

  late final LocalAuthentication auth;
  bool supportState = false;
  BiometricType? biometricType;

  void initBiometric() {
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((value) {
      supportState = value;
      emit(SupportBiometricState());
    });

    auth.getAvailableBiometrics().then((biometrics) {
      print('Available biometrics: $biometrics');

      if (Platform.isIOS) {
        if (biometrics.contains(BiometricType.face)) {
          biometricType = BiometricType.face;
          emit(GetAvailableBiometricsState());
        } else if (biometrics.contains(BiometricType.fingerprint)) {
          biometricType = BiometricType.fingerprint;
          emit(GetAvailableBiometricsState());
        }
      } else if (Platform.isAndroid) {
        // Most Android phones use fingerprint
        if (biometrics.contains(BiometricType.strong) ||
            biometrics.contains(BiometricType.weak)) {
          biometricType = BiometricType.fingerprint;
          emit(GetAvailableBiometricsState());
        }
      }
    });
  }

  Future<void> loginWithFingerprint() async {
    try {
      bool isAuthenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to login',
        options: const AuthenticationOptions(
          stickyAuth: true,
          sensitiveTransaction: true,
          useErrorDialogs: true,
          biometricOnly: true,
        ),
      );

      if (isAuthenticated) {
        final userBox = Hive.box<UserModel>(usersConst);

        if (userBox.isNotEmpty) {
          // _showAccountsDialog(userBox.values.toList());
          emit(AuthenticationNotEmptyState(userBox: userBox.values.toList()));
        } else {
          showToast(
            msg: 'No user data found, please sign up',
            state: ToastStates.error,
          );
        }
      } else {
        // showToast(
        //   msg: 'Fingerprint authentication failed',
        //   state: ToastStates.error,
        // );
      }
    } catch (e) {
      print('eeeeee : $e');
      showToast(msg: 'Biometric error: $e', state: ToastStates.error);
    }
  }
}
