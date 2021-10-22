import 'package:flutter/material.dart';
import 'package:let_tutor/Ultility/function.dart';

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

    Widget inputEmail = Row(
      children: [
        const Icon(
          Icons.mail,
          color: Colors.blue,
          size: 30,
        ),
        space(20),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
        ),
      ],
    );

    Widget sendButton = Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Send'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text('Forgot password'),
        centerTitle: true,
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
