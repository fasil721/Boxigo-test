import 'package:bloc/bloc.dart';
import 'package:machine_test/services/auth_service.dart';
import 'package:machine_test/utils/flutter_toast.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<UserSignInEvent>(_singUpWithEmailAndPassWord);
  }
  void _singUpWithEmailAndPassWord(
    UserSignInEvent event,
    Emitter<SigninState> emit,
  ) {
    final isValid = _validate(
      email: event.email,
      password: event.password,
    );
    if (isValid) {
      AuthService.signInWithEmailAndPassword(event.email, event.password);
    }
  }

  bool _validate({
    required String password,
    required String email,
  }) {
    if (email.isEmpty) {
      showErrorToast("Please Enter Your Email");
      return false;
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(email)) {
      showErrorToast("Please Enter a valid email");
      return false;
    }

    if (password.isEmpty) {
      showErrorToast("password is required");
      return false;
    } else if (password.length < 6) {
      showErrorToast("Password must be atleast 6 digits");
      return false;
    }
    return true;
  }
}
