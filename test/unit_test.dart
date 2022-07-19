import 'package:flutter_test/flutter_test.dart';
import 'package:machine_test/utils/utils.dart';

void main() {
  group("sign in valdation test", () {
    test("email test", () {
      bool isValid = false;
      isValid = Utils.validateSignInForm(password: 'fas', email: "afads");
      expect(isValid, false);
    });
  });
}
