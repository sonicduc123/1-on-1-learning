import 'package:flutter/material.dart';
import 'package:let_tutor/routes.dart';
import 'package:let_tutor/ui/authentication/widgets/login_form.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/space.dart';

typedef LoginSuccessCallback = Function();

class Login extends StatelessWidget {
  const Login({Key? key, required this.loginSuccessCallback}) : super(key: key);

  final LoginSuccessCallback loginSuccessCallback;
  @override
  Widget build(BuildContext context) {
    Widget logo = const Image(
      image: AssetImage('assets/images/logo.png'),
      height: 150,
      width: 150,
    );

    Widget appName = const Text(
      'S TUTOR',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );

    Widget loginForm = LoginForm(loginSuccessCallback);

    Widget otherWayLogin = const Text(
      'Or continue with',
      style: TextStyle(
        color: Colors.grey,
      ),
    );

    Widget facebookIcon = GestureDetector(
      child: const Image(
        image: AssetImage('assets/images/facebook_icon.png'),
        height: 50,
        width: 50,
      ),
      onTap: null,
    );

    Widget googleIcon = GestureDetector(
      child: const Image(
        image: AssetImage('assets/images/google_icon.png'),
        height: 50,
        width: 50,
      ),
      onTap: null,
    );

    Widget signUpRediect = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 15),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.register);
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: createAppBar('Sign in', false, context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              logo,
              appName,
              space(20),
              loginForm,
              space(15),
              otherWayLogin,
              space(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  facebookIcon,
                  space(30),
                  googleIcon,
                ],
              ),
              space(15),
              signUpRediect
            ],
          ),
        ),
      ),
    );
  }
}
