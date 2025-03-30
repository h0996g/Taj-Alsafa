part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class GetAvailableBiometricsState extends LoginState {}

final class AuthenticationNotEmptyState extends LoginState {
  final List<UserModel> userBox;

  AuthenticationNotEmptyState({required this.userBox});
}

final class SupportBiometricState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

final class LoginSuccessState extends LoginState {
  final String userId;

  LoginSuccessState(this.userId);
}
