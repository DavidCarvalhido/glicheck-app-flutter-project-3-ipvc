import 'package:flutter/material.dart';

import 'package:gli_check/configs/color_constants.dart';
import 'package:gli_check/components/button_component.dart';
import 'package:gli_check/components/text_field_component.dart';
import 'package:gli_check/components/dropdown_component.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  // -- Text editing controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userWeightController = TextEditingController();
  final userHeightController = TextEditingController();
  final ageController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();

  // -- Create a global key that uniquely identifies the Form widget and allows validation of the form.
  // -- Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  // -- Method for sign up the user
  void signUpUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
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
                  'Create your profile here',
                  style: TextStyle(
                    color: ColorConstants.tintDarkGrey,
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                // -- Email TextField
                TextFieldComponent(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty()) {
                  //     return 'Email is missing';
                  //   }
                  //   return null;
                  // },
                  /*validator: (value) {
                    if (!value.isValidEmail) return 'Enter a valid email!';
                  },*/
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // -- Username TextField
                TextFieldComponent(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // -- Password TextField
                TextFieldComponent(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // -- RePassword TextField
                TextFieldComponent(
                  controller: rePasswordController,
                  hintText: 'Rewrite your password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      // -- FirstName TextField
                      child: TextFieldComponent(
                        controller: firstNameController,
                        hintText: 'First name',
                        obscureText: false,
                      ),
                    ),
                    Flexible(
                      // -- LastName TextField
                      child: TextFieldComponent(
                        controller: lastNameController,
                        hintText: 'Last name',
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      // -- User Weight TextField
                      child: TextFieldComponent(
                        controller: userWeightController,
                        hintText: 'Weight',
                        obscureText: false,
                      ),
                    ),
                    Flexible(
                      // -- User Height TextField
                      child: TextFieldComponent(
                        controller: userHeightController,
                        hintText: 'Height',
                        obscureText: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // -- Age TextField
                TextFieldComponent(
                  controller: ageController,
                  hintText: 'Age',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // -- Country DropdownMenu & PhoneNumber TextField
                const DropdownComponent(
                  // controller: phoneNumberController,
                  // labelText: 'Phone number',
                  // obscureText: false,
                ),
                const SizedBox(
                  height: 35.0,
                ),
                ButtonComponent(
                  onTap: signUpUser,
                ),
                const SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
