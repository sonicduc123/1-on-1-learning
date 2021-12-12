import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget registerButton = createButtonExpanded('Register', action: () {
      if (formKey.currentState!.validate()) {
        log('Sign up: ');
        log('name: ' + nameController.text);
        log('email: ' + emailController.text);
        log('password: ' + passwordController.text);
        log('confirmpassword: ' + confirmPasswordController.text);
        log('-----------------------------------------------');
        Navigator.pop(context);
      }
    });

    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        // Pressing space in the field will now move to the next field.
        SingleActivator(LogicalKeyboardKey.enter): NextFocusIntent(),
      },
      //  child: FocusTraversalGroup(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            createRegisterInput('Full name', false, controller: nameController),
            createRegisterInput('Email', false, controller: emailController),
            createRegisterInput('Password', true,
                controller: passwordController),
            createRegisterInput('Confirm password', true,
                controller: confirmPasswordController,
                passwordController: passwordController),
            space(30),
            registerButton,
          ],
        ),
      ),
      //  ),
    );
  }
}
