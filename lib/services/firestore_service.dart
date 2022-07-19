// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:machine_test/models/user_model.dart';

import 'package:machine_test/pages/home/home_page.dart';
import 'package:machine_test/utils/flutter_toast.dart';

class FirestoreService {
  static Future<void> postDetailsToFirestore({
    required String uid,
    required String fullName,
    required String phoneNo,
    required String email,
  }) async {
    // calling our firestore
    // calling our user model
    // sending these values

// writing all the values
    final userModel = UserModel()
      ..email = email
      ..fullName = fullName
      ..uid = uid
      ..phoneNo = phoneNo;
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      // await users.doc(uid).set(userModel.toMap())
      await users.add(userModel.toMap()).then((value) {
        log('Sign up successfully');
        Get.offAll(() => const HomePage());
      });
    } on FirebaseException catch (err) {
      log("error code: ${err.code}");
      if (err.message != null) {
        showErrorToast(err.message!);
      }
    } catch (err) {
      log("error : $err");
    }
  }

  static Future<UserModel?> readDataFromFirestore({
    required String email,
  }) async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final value = await users.where('email', isEqualTo: email).get();
      final data = value.docs.first.data() as Map?;
      if (data != null) {
        final user = UserModel.fromMap(Map<String, String>.from(data));
        return user;
      }
    } on FirebaseException catch (err) {
      log("error code: ${err.code}");
      if (err.message != null) {
        showErrorToast(err.message!);
      }
    } catch (err) {
      log("error : $err");
    }
    return null;
  }
}
