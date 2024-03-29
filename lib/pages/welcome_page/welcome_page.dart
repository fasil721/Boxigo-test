import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/pages/signup_page/signup_page.dart';
import 'package:machine_test/services/auth_service.dart';

import '../signin/signin_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff7f6fb),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: FadeInDown(
                    child: Image.asset(
                      'assets/Welcome-bro.png',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FadeInUp(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          "Let's get started",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Never a better time than now to start.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 38,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => SignUpPage()),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xff14B8A6),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                'Create Account',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                           
                            onPressed: () => Get.to(() => SignInPage()),
                            style: _buttonStyle(),
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        const Color(0xff14B8A6),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }
}
