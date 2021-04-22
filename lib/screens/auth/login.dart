import 'package:covid19_tracker/router/router_constant.dart';
import 'package:covid19_tracker/screens/home.dart';
import 'package:covid19_tracker/services/auth_services.dart';
import 'package:covid19_tracker/services/navigation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService _auth = AuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Hospital Tracker'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Form(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 1)),
              width: 350,
              height: screen.height * 0.5,
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (value) =>
                      value.isEmpty ? 'Enter a valid email' : null,
                    ),
                    TextFormField(
                      controller: _passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              print(_emailController.text);
                              _auth.userLogIn(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                            },
                            child: Text('SIGN IN')),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              NavigationService.instance
                                  .navigateToReplacement(signUpScreen);
                            },
                            child: Text('SIGN UP'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
