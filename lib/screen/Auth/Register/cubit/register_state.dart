part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class ProfileImageSelected extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class UserInfoSaved extends RegisterState {}

final class UserAlreadyExistsErrorState extends RegisterState {
  final String errorMessage;

  UserAlreadyExistsErrorState(this.errorMessage);
}
