import 'package:flutter/material.dart';
import 'package:let_tutor/ui/authentication/widgets/register_form.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/space.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget registerForm = const RegisterForm();

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
      onTap: () {},
    );

    Widget googleIcon = GestureDetector(
      child: const Image(
        image: AssetImage('assets/images/google_icon.png'),
        height: 50,
        width: 50,
      ),
      onTap: null,
    );

    Widget signInRediect = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(fontSize: 15),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: createAppBar('Sign up', true, context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              registerForm,
              space(15),
              // otherWayLogin,
              // space(15),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     facebookIcon,
              //     space(30),
              //     googleIcon,
              //   ],
              // ),
              space(10),
              signInRediect,
            ],
          ),
        ),
      ),
    );
  }
}
