import 'package:flutter/material.dart';
import 'package:let_tutor/Authentication/login/input.dart';
import 'package:let_tutor/Function/button_expanded.dart';
import 'package:let_tutor/Function/space.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logo = const Image(
      image: AssetImage('images/logo.png'),
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

    Widget emailInput = createInput('Email', false);
    Widget passwordInput = createInput('Password', true);
    Widget loginButton = createButtonExpanded('Log In');

    Widget loginForm = Form(
      child: Column(
        children: [
          emailInput,
          space(20),
          passwordInput,
          space(5),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
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

    Widget otherWayLogin = const Text(
      'Or continue with',
      style: TextStyle(
        color: Colors.grey,
      ),
    );

    Widget facebookIcon = GestureDetector(
      child: const Image(
        image: AssetImage('images/facebook_icon.png'),
        height: 50,
        width: 50,
      ),
      onTap: null,
    );

    Widget googleIcon = GestureDetector(
      child: const Image(
        image: AssetImage('images/google_icon.png'),
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
          onPressed: () {},
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
      appBar: AppBar(
        title: const Text(
          'Sign in',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
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
