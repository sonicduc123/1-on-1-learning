import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/post_api.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/authentication/widgets/login_input.dart';
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
      if (value.getString("email") != null) {
        emailController.text = value.getString("email")!;
        passwordController.text = value.getString("password")!;
      }
    });
    super.initState();
  }

  Future<void> onLoginPress() async {
    setState(() {
      isLoading = true;
    });

    bool isLoginSuccess = await PostAPI.loginAccount(
        emailController.text, passwordController.text, context);

    setState(() {
      isLoading = false;
    });
    if (isLoginSuccess) {
      widget.loginSuccessCallback();
    }
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
          if (isLoading)
            Column(
              children: [
                space(10),
                const CircularProgressIndicator(),
              ],
            )
        ],
      ),
    );
  }
}
