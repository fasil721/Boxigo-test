part of 'signup_bloc.dart';

abstract class SignupEvent {}

class UserSignUpEvent extends SignupEvent {
  final String email;
  final String password;
  final String phoneNo;

  UserSignUpEvent({
    required this.password,
    required this.email,
    required this.phoneNo,
  });
}
