import 'package:ff/models/shared/constants.dart';
import 'package:ff/models/shared/loading.dart';
import 'package:ff/services/auth.dart';
// import 'package:ff/widgets/Input.dart';
import 'package:ff/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:ff/theme/colors.dart';

class Register extends StatefulWidget {
  final Function function;
  const Register({super.key, required this.function});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: AppColors.blue,
              elevation: 0.0,
              title: const Text(
                'REGISTER',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Form(
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
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$')
                                      .hasMatch(value)) {
                                return "비밀번호 8글자 이상, 대문자 및 소문자 포함, 숫자 포함, \n기호 포함 되어 있는지 확인하세요";
                              } else {
                                return null;
                              }
                            },
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
                                setState(() {
                                  loading = true;
                                });
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = "Error!";
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
                            style: const TextStyle(color: AppColors.red),
                          ),
                          const SizedBox(height: 40)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
