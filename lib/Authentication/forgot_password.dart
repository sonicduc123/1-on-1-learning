import 'package:flutter/material.dart';
import 'package:let_tutor/Function/button_expanded.dart';
import 'package:let_tutor/Function/input_with_icon.dart';
import 'package:let_tutor/Function/space.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logo = const Image(
      image: AssetImage('images/logo.png'),
      height: 150,
      width: 150,
    );

    Widget description = const Text(
      "Enter your email address and we'll send you a link to reset your password",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
    );

    Widget inputEmail = createInputWithIcon(
      Icons.mail,
      'Enter your email',
    );

    Widget sendButton = createButtonExpanded('Send');

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        title: const Text(
          'Forgot password',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              logo,
              space(30),
              description,
              space(30),
              inputEmail,
              space(30),
              sendButton,
            ],
          ),
        ),
      ),
    );
  }
}