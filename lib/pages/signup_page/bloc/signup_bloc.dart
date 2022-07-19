import 'package:bloc/bloc.dart';
import 'package:machine_test/services/auth_service.dart';
import 'package:machine_test/utils/utils.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<UserSignUpEvent>(_singUpWithEmailAndPassWord);
    on<GoogleSignUpEvent>((event, emit) => AuthService.signInWithGoogle());
  }
  //sign up the user using email and password
  void _singUpWithEmailAndPassWord(
    UserSignUpEvent event,
    Emitter<SignupState> emit,
  ) {
    //validating the user given datas. if it's not valid this funcion will return false
    final isValid = Utils.validateSignUpForm(
      email: event.email,
      password: event.password,
      phoneNo: event.phoneNo,
      name: event.name,
    ); //checking is data valdited or not
    if (isValid) {
      // sign up the user
      AuthService.signUpWithEmailAndPassword(
        event.email,
        event.password,
        event.name,
        event.phoneNo,
      );
    }
  }
}
