import 'package:flutter/material.dart';
import 'package:let_tutor/Ultility/function.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget input(String name, bool isPassword) {
      return Column(
        children: [
          space(20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              name + ' *',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          space(5),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your ' + name,
              contentPadding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            obscureText: isPassword,
          ),
        ],
      );
    }

    Widget registerForm = Form(
      child: Column(
        children: [
          input('Full name', false),
          input('Email', false),
          input('Password', true),
          input('Confirm password', true),
          space(30),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                  ),
                ),
              ),
            ],
          ),
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
      onTap: () {},
    );

    Widget googleIcon = GestureDetector(
      child: const Image(
        image: AssetImage('images/google_icon.png'),
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
          onPressed: () {},
          child: const Text(
            'Log In',
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
        title: const Text('Sign up'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_new),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              registerForm,
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
              space(10),
              signInRediect,
            ],
          ),
        ),
      ),
    );
  }
}
