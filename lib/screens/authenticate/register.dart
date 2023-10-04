import 'package:ff/services/auth.dart';
// import 'package:ff/widgets/Input.dart';
import 'package:ff/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:ff/theme/colors.dart';

class Register extends StatefulWidget {
  final Function function;
  Register({required this.function});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        elevation: 0.0,
        title: const Text(
          '로그인',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? "Enter an email" : null,
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    validator: (val) =>
                        val!.length < 6 ? 'Enter 6+ chars' : null,
                    onChanged: (value) {
                      setState(() => password = value);
                    },
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.function();
                          },
                          child: const Text(
                            "로그인",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    text: "사용자 가입",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error = "Error!");
                        }
                      }
                    },
                    isValid: true,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    error,
                    style: TextStyle(color: AppColors.red),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
