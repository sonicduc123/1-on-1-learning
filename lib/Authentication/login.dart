import 'package:flutter/material.dart';

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
      'S TuTor',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
    //);

    Widget space(double size) => SizedBox(
          height: size,
          width: size,
        );

    Widget loginForm = Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              contentPadding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          space(20),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your password',
              labelText: 'Password',
              contentPadding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            obscureText: true,
          ),
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
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Log In',
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

    Widget facebookIcon = const Image(
      image: AssetImage('images/facebook_icon.png'),
      height: 50,
      width: 50,
    );

    Widget googleIcon = const Image(
      image: AssetImage('images/google_icon.png'),
      height: 50,
      width: 50,
    );

    Widget signUpRediect = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        space(1),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
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
