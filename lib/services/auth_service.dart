// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:machine_test/pages/home/home_page.dart';
import 'package:machine_test/utils/flutter_toast.dart';

class AuthService {
  static Future<void> signInWithGoogle() async {
    try {
      final googleuser = await GoogleSignIn().signIn();
      if (googleuser != null) {
        final googleAuth = await googleuser.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        log("is new user : ${userCredential.additionalUserInfo?.isNewUser}");
      }
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

  static Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log('Sign up successfully');
        Get.offAll(() => const HomePage());
      });
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

  static Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        log('Sign in successfully');
        Get.offAll(() => const HomePage());
      });
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
