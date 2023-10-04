import 'package:ff/services/auth.dart';
// import 'package:ff/widgets/Input.dart';
import 'package:ff/widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:ff/theme/colors.dart';

class SignIn extends StatefulWidget {
  final Function function;
  SignIn({required this.function});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  TextFormField(
                    onChanged: (value) {
                      setState(() => email = value);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
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
