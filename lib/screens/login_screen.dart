import 'package:flutter/material.dart';
import '../validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'you@example.com',
        ),
        validator: validateEmail,
        onSaved: (String value) {
          email = value;
        });
  }

  Widget passwordField() {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Enter password',
            hintText: 'Password',
          ),
          validator: validatePassword,
          onSaved: (String value) {
            password = value;
          }),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time to post $email and $password to my API');
        }
      },
    );
  }
}
