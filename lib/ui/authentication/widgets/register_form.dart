import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:let_tutor/data/network/endpoints.dart';
import 'package:let_tutor/models/auth.dart';
import 'package:let_tutor/models/error.dart';
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'You have registered successfully. Please check your email to active.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> onRegisterPress() async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.post(
      Uri.parse(Endpoints.register),
      body: {
        'email': emailController.text,
        'password': passwordController.text
      },
    );
    log("receive: " + response.body);
    log("status: " + response.statusCode.toString());
    setState(() {
      isLoading = false;
    });
    if (response.statusCode != 201) {
      ErrorFetch error = ErrorFetch.fromJson(jsonDecode(response.body));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message!),
        ),
      );
      return;
    } else {
      try {
        Auth auth = Auth.fromJson(jsonDecode(response.body));
      } catch (e) {
        log(e.toString());
      }
    }
    Navigator.pop(context);
    _showMyDialog();
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
