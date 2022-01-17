import 'package:flutter/material.dart';
import 'package:let_tutor/data/network/post_api.dart';
import 'package:let_tutor/widgets/app_bar.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/input_with_icon.dart';
import 'package:let_tutor/widgets/space.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> onForgotPasswordPress() async {
    setState(() {
      isLoading = true;
    });

    await PostAPI.forgotPasswordAccount(emailController.text, context);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget logo = const Image(
      image: AssetImage('assets/images/logo.png'),
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

    Widget inputEmail =
        createInputWithIcon(Icons.mail, 'email', emailController);

    Widget sendButton = createButtonExpanded('Send', action: () async {
      if (formKey.currentState!.validate()) {
        await onForgotPasswordPress();
      }
    });

    return Scaffold(
      appBar: createAppBar('Forgot password', true, context),
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
              Form(key: formKey, child: inputEmail),
              space(30),
              sendButton,
              if (isLoading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
