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
