import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:machine_test/pages/signin/signin_page.dart';
import 'package:machine_test/pages/signup_page/bloc/signup_bloc.dart';
import 'package:machine_test/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNoController = TextEditingController();

  @override
  void dispose() {
    SystemChannels.textInput.invokeMethod("TextInput.hide");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SignupBloc(),
        child: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<SignupBloc>(context);
            return Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: const Color(0xfff7f6fb),
              appBar: AppBar(
                toolbarHeight: 70,
                leadingWidth: 80,
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: Get.back,
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 26,
                    color: Colors.black54,
                  ),
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        FadeInDown(
                          child: Column(
                            children: [
                              Container(
                                width: Get.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/Mobile login-bro.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: Get.height * 0.025),
                              const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: Get.height * 0.02),
                              const Text(
                                "Add your Detials and Sign up and explore the app",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        FadeInUp(
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  style: _textStyle(),
                                  decoration:
                                      _textFieldDecoration('Enter Email'),
                                ),
                                SizedBox(height: Get.height * .025),
                                TextField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  style: _textStyle(),
                                  decoration:
                                      _textFieldDecoration("Enter Password"),
                                ),
                                SizedBox(height: Get.height * .025),
                                TextField(
                                  controller: phoneNoController,
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.done,
                                  style: _textStyle(),
                                  decoration:
                                      _textFieldDecoration("Enter Phone No"),
                                ),
                                SizedBox(height: Get.height * .025),
                                SizedBox(
                                  height: 45,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => bloc.add(
                                      UserSignUpEvent(
                                        password:
                                            passwordController.text.trim(),
                                        email: emailController.text.trim(),
                                        phoneNo: phoneNoController.text.trim(),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Colors.white,
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14B8A6),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ),
                                    child:
                                        // ? const SizedBox(
                                        //     height: 20,
                                        //     width: 20,
                                        //     child: CircularProgressIndicator(
                                        //       strokeWidth: 2,
                                        //       color: Colors.white,
                                        //     ),
                                        //   )
                                        // :
                                        const Text(
                                      'Sign up',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(height: Get.height * .01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "Already have an account ? ",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black38,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    InkWell(
                                      onTap: () => Get.off(() => SignInPage()),
                                      child: const Text(
                                        "Sign in",
                                        style: TextStyle(
                                          fontSize: 13,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff14B8A6),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(width: 5)
                                  ],
                                ),
                                SizedBox(height: Get.height * .01),
                                const Text(
                                  "- OR -",
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: Get.height * .01),
                                SizedBox(
                                  height: 45,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        AuthService.signInWithGoogle(),
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Colors.white,
                                      ),
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(5),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14B8A6),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child:
                                              Image.asset("assets/g-icon.png"),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "Sign up with Google",
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );

  TextStyle _textStyle() => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
      );

  InputDecoration _textFieldDecoration(String hintText) => InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        hintText: hintText,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
