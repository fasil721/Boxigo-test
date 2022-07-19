part of 'signin_bloc.dart';

abstract class SigninEvent {}

class UserSignInEvent extends SigninEvent {
  final String email;
  final String password;

  UserSignInEvent({
    required this.password,
    required this.email,
  });
}
