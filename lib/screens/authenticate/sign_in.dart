import 'package:ff/models/shared/loading.dart';
import 'package:ff/services/auth.dart';
// import 'package:ff/widgets/Input.dart';
import 'package:ff/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:ff/theme/colors.dart';
import 'package:ff/models/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function function;
  SignIn({required this.function});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Email', labelText: 'Email *'),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                    .hasMatch(value)) {
                              return "Enter Correct Email Address";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password', labelText: 'Password *'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Valid Password";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
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
                                  "사용자 가입",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: AppColors.blue,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => PasswordResetView()),
                                  // );
                                },
                                child: const Text(
                                  "비밀번호를 잊어버렸나요?",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Button(
                          text: "로그인",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = "Error Signing In T.T";
                                  loading = false;
                                });
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
