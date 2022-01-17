import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:let_tutor/data/network/post_api.dart';
import 'package:let_tutor/ui/authentication/widgets/register_input.dart';
import 'package:let_tutor/widgets/button_expanded.dart';
import 'package:let_tutor/widgets/space.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  //TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> onRegisterPress() async {
    setState(() {
      isLoading = true;
    });

    await PostAPI.registerAccount(
        emailController.text, passwordController.text, context);

    setState(() {
        isLoading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget registerButton = createButtonExpanded('Register', action: () async {
      if (formKey.currentState!.validate()) {
        await onRegisterPress();
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
            //createRegisterInput('Full name', false, controller: nameController),
            createRegisterInput('Email', false, controller: emailController),
            createRegisterInput('Password', true,
                controller: passwordController),
            createRegisterInput('Confirm password', true,
                controller: confirmPasswordController,
                passwordController: passwordController),
            space(30),
            registerButton,
            space(10),
            if (isLoading) const CircularProgressIndicator(),
          ],
        ),
      ),
      //  ),
    );
  }
}
