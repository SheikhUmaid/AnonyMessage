// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/button.dart';
import '../components/textfields.dart';
import '../utils/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegisterController registerController = Get.put(RegisterController());
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
                  height: 10,
                ),
                Text(
                  'Welcome back User',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 20,
                ),
                textFiled(
                  hint: 'Name?',
                  textController: registerController.nameController.value,
                ),
                SizedBox(
                  height: 20,
                ),
                textFiled(
                  hint: 'Email?',
                  textController: registerController.emailController.value,
                ),
                SizedBox(
                  height: 20,
                ),
                textFiled(
                  hint: 'Username?',
                  textController: registerController.usernameController.value,
                ),
                SizedBox(
                  height: 20,
                ),
                textFiled(
                  obsText: true,
                  hint: 'Password?',
                  textController: registerController.passwordController.value,
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
                    return !registerController.isRegistering.value
                        ? Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white),
                          )
                        : CircularProgressIndicator(
                            color: Colors.white,
                          );
                  }),
                  onTap: () {
                    registerController.Register();
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
                        child: Icon(Icons.restaurant_menu_sharp),
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
                    Text('Already a user?'),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text('Sign in here!'),
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
