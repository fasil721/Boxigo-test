part of 'signup_bloc.dart';

abstract class SignupEvent {}

class UserSignUpEvent extends SignupEvent {
  final String email;
  final String password;
  final String name;
  final String phoneNo;

  UserSignUpEvent({
    required this.name,
    required this.password,
    required this.email,
    required this.phoneNo,
  });
}

class GoogleSignUpEvent extends SignupEvent {}
