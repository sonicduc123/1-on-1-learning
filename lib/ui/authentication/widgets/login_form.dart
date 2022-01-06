import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/authentication/widgets/login_input.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';

typedef LoginSuccessCallback = Function();

class LoginForm extends StatefulWidget {
  const LoginForm(this.loginSuccessCallback, {Key? key}) : super(key: key);

  final LoginSuccessCallback loginSuccessCallback;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget emailInput = createInput('Email', false, emailController);

    Widget passwordInput = createInput('Password', true, passwordController);

    Widget loginButton = createButtonExpanded('Log In', action: () {
      if (formKey.currentState!.validate()) {
        log('Log in: ');
        log('email: ' + emailController.text);
        log('password:' + passwordController.text);
        log('--------------------------------------');
        widget.loginSuccessCallback();
      }
    });

    return Form(
      key: formKey,
      child: Column(
        children: [
          emailInput,
          space(20),
          passwordInput,
          space(5),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.forgotPassword);
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
              ),
            ),
          ),
          space(5),
          loginButton,
        ],
      ),
    );
  }
}
