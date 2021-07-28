import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramp_up/Controller/login_controller.dart';
import 'package:ramp_up/Screen/home_screen.dart';
import 'package:ramp_up/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Form(
              key: _formKey,
              child: Obx(
                () => Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        }
                        return 'E-mail can not be empty';
                      },
                      onChanged: (email) {
                        loginController.emailValidation(email: email);
                      },
                      controller: emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter email',
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    TextFormField(
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        }
                        return 'passowrd can not be empty';
                      },
                      onChanged: (password) {
                        loginController.passwordValidation(password: password);
                      },
                      controller: passwordTextController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                    ),
                    ...List.generate(
                      loginController.infos.length,
                      (index) => InfoWidget(
                        isTrue: loginController.infos[index]['status'] as bool,
                        infoText:
                            loginController.infos[index]['info'] as String,
                      ),
                    ).toList(),
                    ElevatedButton(
                      onPressed: loginController.infos
                              .any((info) => info['status'] == false)
                          ? null
                          : () {
                              final snackBar = const SnackBar(
                                  content: Text('Password is wrong!'));
                              if (passwordTextController.text != password) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                FocusScope.of(context).unfocus();
                              } else {
                                Get.off<dynamic>(() => const HomeScreen());
                              }
                            },
                      child: const Text('Login'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    this.isTrue,
    this.infoText,
  }) : super(key: key);

  final bool? isTrue;
  final String? infoText;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        child: Row(
          children: [
            Icon(
              Icons.check,
              color: isTrue! ? Colors.green : Colors.grey.shade500,
            ),
            const SizedBox(width: defaultPadding / 2),
            Expanded(
              child: Text(
                infoText!,
                style: TextStyle(
                  color: isTrue! ? Colors.green : Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
      );
}
