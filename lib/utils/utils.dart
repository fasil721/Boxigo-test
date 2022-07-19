// ignore_for_file: avoid_classes_with_only_static_members

import 'package:machine_test/utils/flutter_toast.dart';

class Utils {
  static bool validateSignInForm({
    required String password,
    required String email,
  }) {
    //validating the email
    if (email.isEmpty) {
      showErrorToast("Please Enter Your Email");
      return false;
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(email)) {
      showErrorToast("Please Enter a valid email");
      return false;
    }
    //validating the password
    if (password.isEmpty) {
      showErrorToast("password is required");
      return false;
    } else if (password.length < 6) {
      showErrorToast("Password must be atleast 6 digits");
      return false;
    }
    return true;
  }

  static bool validateSignUpForm({
    required String password,
    required String email,
    required String phoneNo,
    required String name,
  }) {
    //validating the email
    if (email.isEmpty) {
      showErrorToast("Please Enter Your Email");
      return false;
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(email)) {
      showErrorToast("Please Enter a valid email");
      return false;
    } //validating the phone
    if (phoneNo.isEmpty) {
      showErrorToast("Phone no is required");
      return false;
    } else if (phoneNo.length != 10) {
      showErrorToast("Please Enter a valid PhoneNo");
      return false;
    } //validating the fullname
    if (name.isEmpty) {
      showErrorToast("Fullname no is required");
      return false;
    } else if (name.length < 3) {
      showErrorToast("Full name must be atleast 3 charector");
      return false;
    }
    //validating the password
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
