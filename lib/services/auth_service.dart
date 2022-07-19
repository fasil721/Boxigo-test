// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:machine_test/pages/home/home_page.dart';
import 'package:machine_test/services/firestore_service.dart';
import 'package:machine_test/utils/flutter_toast.dart';

class AuthService {
  //sign in with google auth
  static Future<void> signInWithGoogle() async {
    try {
      final googleuser = await GoogleSignIn().signIn();
      if (googleuser != null) {
        final googleAuth = await googleuser.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (creadential) {
            if (creadential.user != null) {
              //storing the signed user data to firestore
              FirestoreService.postDetailsToFirestore(
                uid: creadential.user!.uid,
                fullName: creadential.user!.displayName ?? '',
                phoneNo: creadential.user!.phoneNumber ?? '',
                email: creadential.user!.email ?? '',
              );
            }
          },
        );
      }
      //its for detect firebase validation
    } on FirebaseAuthException catch (err) {
      log("error code: ${err.code}");
      log("error message : ${err.message}");
    } on PlatformException catch (err) {
      if (err.message != null) {
        showErrorToast(err.message!);
      }
    } catch (err) {
      log("error : $err");
    }
  }
  // sign up with email and password
  static Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String fulllName,
    String phoneNo,
  ) async {
    final auth = FirebaseAuth.instance;
    try {
      
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((creadential) {
        //storing the user data to firestore
        FirestoreService.postDetailsToFirestore(
          uid: creadential.user!.uid,
          fullName: fulllName,
          phoneNo: phoneNo,
          email: email,
        );
      });
      //detect for firebase validations
    } on FirebaseAuthException catch (err) {
      log("error code: ${err.code}");
      if (err.message != null) {
        showErrorToast(err.message!);
      }
    } on PlatformException catch (err) {
      if (err.message != null) {
        showErrorToast(err.message!);
      }
    } catch (err) {
      log("error : $err");
    }
  }
  // sign in with email and passwoed
  static Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        log('Sign up successfully');
        Get.offAll(() => const HomePage());
      });
      //detect for firebase side validations
    } on FirebaseAuthException catch (err) {
      log("error code: ${err.code}");
      if (err.message != null) {
        showErrorToast(err.message!);
      }
    } on PlatformException catch (err) {
      if (err.message != null) {
        showErrorToast(err.message!);
      }
    } catch (err) {
      log("error : $err");
    }
  }
}
