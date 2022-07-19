part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class UserDataLoaded extends HomeState {
  final UserModel? usermodel;

  UserDataLoaded({this.usermodel});
}
