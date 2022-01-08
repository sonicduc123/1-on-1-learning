import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/auth.dart';
import 'package:let_tutor/models/error.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/authentication/widgets/login_input.dart';
import 'package:let_tutor/utils/handle_error_fetch.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool isLoading = false;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      emailController.text = value.getString("email")!;
      passwordController.text = value.getString("password")!;
    });
  }

  Future<void> onLoginPress() async {
    setState(() {
      isLoading = true;
    });
    Response response = await post(Uri.parse(Endpoints.login), body: {
      "email": emailController.text,
      "password": passwordController.text,
    });
    setState(() {
      isLoading = false;
    });
    if (response.statusCode != 200) {
      HandleErrorFetch(response.body, context);
      return;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("email", emailController.text);
      prefs.setString("password", passwordController.text);
      Auth auth = Auth.fromJson(jsonDecode(response.body));
      prefs.setString("accessToken", auth.tokens!.access!.token!);
      prefs.setString("refreshToken", auth.tokens!.refresh!.token!);
    }
    widget.loginSuccessCallback();
  }

  @override
  Widget build(BuildContext context) {
    Widget emailInput = createInput('Email', false, emailController);

    Widget passwordInput = createInput('Password', true, passwordController);

    Widget loginButton = createButtonExpanded('Log In', action: () async {
      if (formKey.currentState!.validate()) {
        await onLoginPress();
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
