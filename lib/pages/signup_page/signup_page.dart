import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final textController = TextEditingController();
  //  final textController = TextEditingController();

  @override
  void dispose() {
    SystemChannels.textInput.invokeMethod("TextInput.hide");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xfff7f6fb),
        appBar: AppBar(
          toolbarHeight: 80,
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
                          width: Get.width * 0.45,
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
                          'Registration',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        const Text(
                          "Add your phone number. we'll send you a verification code so we know you're real",
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
                  SizedBox(height: Get.height * 0.04),
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
                            controller: textController,
                            keyboardType: TextInputType.text,
                            style: _textStyle(),
                            decoration: _textFieldDecoration('Enter Email'),
                          ),
                          SizedBox(height: Get.height * .025),
                          TextField(
                            controller: textController,
                            keyboardType: TextInputType.text,
                            style: _textStyle(),
                            decoration: _textFieldDecoration("Enter Password"),
                          ),
                          SizedBox(height: Get.height * .025),
                          TextField(
                            controller: textController,
                            keyboardType: TextInputType.text,
                            style: _textStyle(),
                            decoration: _textFieldDecoration("Enter Phone No"),
                          ),
                          SizedBox(height: Get.height * .025),
                          SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                // final regex = RegExp(r'^.{10}$');
                                // if (regex.hasMatch(textController.text)) {
                                //   SystemChannels.textInput
                                //       .invokeMethod("TextInput.hide");
                                //   setState(() {
                                //     isLoading = true;
                                //   });
                                //   await verifyPhoneNumber(
                                //     textController.text,
                                //     context,
                                //   );
                                //   setState(() {
                                //     isLoading = false;
                                //   });
                                // } else {
                                //   Fluttertoast.showToast(
                                //     msg: "Enter Valid PhoneNumber",
                                //   );
                                // }
                              },
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
                                    borderRadius: BorderRadius.circular(24.0),
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
                                'Register',
                                style: TextStyle(fontSize: 16),
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
