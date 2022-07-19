import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:machine_test/models/user_model.dart';
import 'package:machine_test/pages/welcome_page/welcome_page.dart';
import 'package:machine_test/services/firestore_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final auth = FirebaseAuth.instance;
    on<LoadUserDatas>((event, emit) async {
      final user = auth.currentUser;
      if (user != null) {
        log(user.uid);
        // reading user data from the firestore
        final userModel = await FirestoreService.readDataFromFirestore(
          email: user.email!,
        );
        log("usermodel : ${userModel?.toMap()}");
        emit(UserDataLoaded(usermodel: userModel));
      }
    });
    
    //for sign out user
    on<SignOutEvent>((event, emit) async {
      await auth.signOut();
      Get.offAll(() => WelcomePage());
    });
  }
}
