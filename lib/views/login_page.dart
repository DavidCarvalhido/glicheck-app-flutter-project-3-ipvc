import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:gli_check/configs/color_constants.dart';
import 'package:gli_check/components/button_component.dart';
import 'package:gli_check/components/text_field_component.dart';
import 'package:gli_check/views/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  // -- text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // -- Create a global key that uniquely identifies the Form widget and allows validation of the form.
  // -- Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  // -- Method for sign in the user
  void signInUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: ColorConstants.tintMidOrange,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50.0,
                ),
                Image.asset(
                  'lib/assets/logo_icon.png',
                  width: 90.0,
                  height: 90.0,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Please, login here',
                  style: TextStyle(
                    color: ColorConstants.tintDarkGrey,
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // -- Email TextField
                TextFieldComponent(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  // validator: (value) {
                  //   if(value == null || value.isEmpty()) {
                  //     return 'Email is missing';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // -- Password TextField
                TextFieldComponent(
                  controller: passwordController,
                  hintText: 'Palavra-passe',
                  obscureText: true,
                  // validator: (value) {
                  //   if(value == null || value.isEmpty()) {
                  //     return 'Password is missing';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account?\t',
                              style: TextStyle(
                                color: ColorConstants.tintDarkGrey,
                                fontSize: 16.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Register here',
                              style: TextStyle(
                                color: ColorConstants.tintLightBlue,
                                fontSize: 16.0,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpPage(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ButtonComponent(
                  onTap: signInUser,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
