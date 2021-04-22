import 'package:covid19_tracker/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covid19_tracker/services/auth_services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthService _auth = AuthService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                InputField(
                  validator: (value) => value.isEmpty ? 'Enter an email' : null,
                  controller: _emailController,
                  labelText: 'Email',

                ),
                InputField(
                  validator: (value) =>
                      value.isEmpty ? 'Enter a password' : null,
                  controller: _passwordController,
                  labelText: 'Password',
                ),
                InputField(
                  validator: (value) => value.isEmpty ? 'Enter your First Name' : null,
                  controller: _firstNameController,
                  labelText: 'First Name',
                ),
                InputField(
                  validator: (value) => value.isEmpty ? 'Enter your Last Name' : null,
                  controller: _lastNameController,
                  labelText: 'Last Name',
                ),
                InputField(
                  validator: (value) => value.isEmpty ? 'Enter your Gender' : null,
                  controller: _genderController,
                  labelText: 'Gender',
                ),
                TextButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        _formkey.currentState.save();
                        _auth.registerEmailPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            gender: _genderController.text);

                        print('Registered');
                      }
                    },
                    child: Text('REGISTER'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
