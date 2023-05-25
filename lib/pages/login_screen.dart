// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/button.dart';
import '../components/textfields.dart';
import '../utils/login_controller.dart';
import '../utils/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginControler loginControler = Get.put(LoginControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(
                  Icons.android_rounded,
                  size: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome back User',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                textFiled(
                  hint: 'Username',
                  textController: loginControler.usernameController.value,
                ),
                SizedBox(
                  height: 20,
                ),
                textFiled(
                  obsText: true,
                  hint: 'Password',
                  textController: loginControler.passwordController.value,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('Forgot password?')],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: Obx(() {
                    return !loginControler.loggingIn.value
                        ? Text(
                            'Login in',
                            style: TextStyle(color: Colors.white),
                          )
                        : CircularProgressIndicator();
                  }),
                  onTap: () async {
                    bool? done = await loginControler.getToken();
                    if (done == true) {
                      Navigator.pop(context);
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Text('Or Login with'),
                      Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(Icons.security_update_good_rounded),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.security_update_good_rounded),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a user?'),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.REGISTER);
                      },
                      child: Text('Register now'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
