import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:machine_test/pages/welcome_page/welcome_page.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final auth = FirebaseAuth.instance;
    on<LoadUserDatas>((event, emit) async {
      final user = auth.currentUser;
      emit(UserDataLoaded(user: user));
    });
    on<SignOutEvent>((event, emit) async {
      await auth.signOut();
      Get.offAll(() => WelcomePage());
    });
  }
}
