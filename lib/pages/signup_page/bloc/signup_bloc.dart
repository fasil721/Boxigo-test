import 'package:bloc/bloc.dart';
import 'package:machine_test/services/auth_service.dart';
import 'package:machine_test/utils/flutter_toast.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<UserSignUpEvent>(_singUpWithEmailAndPassWord);
    on<GoogleSignUpEvent>((event, emit) => AuthService.signInWithGoogle());
  }
  void _singUpWithEmailAndPassWord(
    UserSignUpEvent event,
    Emitter<SignupState> emit,
  ) {
    final isValid = _validate(
      email: event.email,
      password: event.password,
      phoneNo: event.phoneNo,
      name: event.name,
    );
    if (isValid) {
      AuthService.signUpWithEmailAndPassword(
        event.email,
        event.password,
        event.name,
        event.phoneNo,
      );
    }
  }

  bool _validate({
    required String password,
    required String email,
    required String phoneNo,
    required String name,
  }) {
    if (email.isEmpty) {
      showErrorToast("Please Enter Your Email");
      return false;
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(email)) {
      showErrorToast("Please Enter a valid email");
      return false;
    }
    if (phoneNo.isEmpty) {
      showErrorToast("Phone no is required");
      return false;
    } else if (phoneNo.length != 10) {
      showErrorToast("Please Enter a valid PhoneNo");
      return false;
    }
    if (name.isEmpty) {
      showErrorToast("Fullname no is required");
      return false;
    } else if (name.length < 3) {
      showErrorToast("Full name must be atleast 3 charector");
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
