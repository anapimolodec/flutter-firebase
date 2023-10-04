import 'package:ff/services/auth.dart';
import 'package:ff/widgets/Input.dart';
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

  String email = "";
  String password = "";

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
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Input(
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                    hintText: '이메일을 입력하세요',
                    labelText: '이메일',
                  ),
                  const SizedBox(height: 20),
                  Input(
                    onChanged: (value) {
                      setState(() => password = value);
                    },
                    hintText: '비밀번호를 입력하세요',
                    labelText: '비밀번호',
                    isPassword: true,
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
                    onPressed: () {
                      print("$email $password");
                    },
                    isValid: true,
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
