import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/data/widgets/apptheme.dart';
import 'package:getx_cli/app/routes/app_pages.dart';

class SignInManagerWithMail extends StatefulWidget {
  const SignInManagerWithMail({Key? key}) : super(key: key);

  @override
  State<SignInManagerWithMail> createState() => _SignInManagerWithMailState();
}

class _SignInManagerWithMailState extends State<SignInManagerWithMail> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    emailController.text = 'Jhon@mail.com';
    passwordController.text = 'ThisIsMyPassword@2';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(children: [
                    const TextSpan(
                      text: 'Sign In ',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: 'With Email',
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColor.appDarkGrey,
                        ))
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    prefixIcon: const Icon(Icons.mail_outline),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.appGrey, width: 2.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      'E-Mail',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_open),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye_rounded,
                        size: 17,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.appGrey, width: 2.0),
                      ),
                      hintText: 'Enter Password'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: AppColor.appGrey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 47,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/home');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(children: [
                    const TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: 'sign up',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes
                              .signup); // replace '/signup' with your desired route name
                        },
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
