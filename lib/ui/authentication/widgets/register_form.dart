import 'package:flutter/material.dart';
import 'package:let_tutor/ui/authentication/widgets/register_input.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget registerButton = createButtonExpanded('Register', action: () {
      if (formKey.currentState!.validate()) {}
    });

    return Form(
      key: formKey,
      child: Column(
        children: [
          createRegisterInput('Full name', false),
          createRegisterInput('Email', false),
          createRegisterInput('Password', true),
          createRegisterInput('Confirm password', true),
          space(30),
          registerButton,
        ],
      ),
    );
  }
}
