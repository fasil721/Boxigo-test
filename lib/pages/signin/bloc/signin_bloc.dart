import 'package:bloc/bloc.dart';
import 'package:machine_test/services/auth_service.dart';
import 'package:machine_test/utils/utils.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<UserSignInEvent>(_singUpWithEmailAndPassWord);
    on<GoogleSignInEvent>((event, emit) => AuthService.signInWithGoogle());
  }
  //sign up with email and password
  void _singUpWithEmailAndPassWord(
    UserSignInEvent event,
    Emitter<SigninState> emit,
  ) {
    //validating the user given datas. if it's not valid this funcion will return false
    final isValid = Utils.validateSignInForm(
      email: event.email,
      password: event.password,
    );
    //checking is data valdited or not
    if (isValid) {
      // sign in the user
      AuthService.signInWithEmailAndPassword(event.email, event.password);
    }
  }
}
