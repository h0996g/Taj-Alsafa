part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class UserInfoLoadingState extends HomeState {}

final class UserInfoSuccessState extends HomeState {}

final class UserInfoErrorState extends HomeState {
  final String errorMessage;

  UserInfoErrorState(this.errorMessage);
}

final class UpdateUserInfoLoadingState extends HomeState {}

final class UpdateUserInfoSuccessState extends HomeState {}

final class UpdateUserInfoErrorState extends HomeState {
  final String errorMessage;

  UpdateUserInfoErrorState(this.errorMessage);
}

final class UpdateUserPasswordLoadingState extends HomeState {}

final class UpdateUserPasswordSuccessState extends HomeState {}

final class UpdateUserPasswordErrorState extends HomeState {
  final String errorMessage;

  UpdateUserPasswordErrorState(this.errorMessage);
}
