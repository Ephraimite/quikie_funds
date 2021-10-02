import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:quikie_funds/components/reuseable_button.dart';
import 'package:quikie_funds/states/auth_state.dart';

import '../constants.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 70),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'create a new account',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter your name',
                              prefixIcon:
                              Icon(Icons.person, color: kCOLOR_PRIMARY),
                              labelText: 'First Name'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter your name',
                              prefixIcon:
                              Icon(Icons.person, color: kCOLOR_PRIMARY),
                              labelText: 'Last Name'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: emailEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Pls use a valid email';
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email, color: kCOLOR_PRIMARY),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: phoneEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'pls Enter your phone number';
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your phone number',
                        prefixIcon: Icon(Icons.phone, color: kCOLOR_PRIMARY),
                        labelText: 'Phone Number',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      controller: passwordEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty';
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.lock, color: kCOLOR_PRIMARY),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Builder(
                    builder: (BuildContext context) => RoundedButton(
                        text: 'Register',
                        textColor: kCOLOR_ACCENT,
                        buttonColor: kCOLOR_PRIMARY,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final progressBar = ProgressHUD.of((context));
                            progressBar!.showWithText("Registering........");
                            return signUpUser(
                              firstNameController.text,
                              lastNameController.text,
                              emailEditingController.text,
                              phoneEditingController.text,
                              passwordEditingController.text,
                              context,
                            );
                          }
                        }),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: kCOLOR_PRIMARY,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUpUser(String firstName, String lastName, String email,
      String phone, String password, BuildContext context) async {
    AuthenticationProvider authenticationProvider =
    Provider.of<AuthenticationProvider>(context, listen: false);
    try {
      if (await authenticationProvider.signUpUser(email, password)) {
        saveUserDetails(firstName, lastName, email, phone, password,
            authenticationProvider);
        final progressBar = ProgressHUD.of(context);
        progressBar!.dismiss();
        Fluttertoast.showToast(
            msg: "Registration successful",
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.green);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Fluttertoast.showToast(
            msg: "something went wrong pls try again",
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.red);
        final progressBar = ProgressHUD.of(context);
        progressBar!.dismiss();
      }
    } catch (e) {
      print(e);
    }
  }

  void saveUserDetails(String firstName, String lastName, String email,
      String phone, String password,
      AuthenticationProvider authenticationProvider) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(authenticationProvider.getUid)
        .set({
      'uid': authenticationProvider.getUid,
      'firstName': firstName,
      'lastName': lastName,
      'email': authenticationProvider.getEmail,
      'phone': int.parse(phone),
      'password': password,

    });
  }

}
