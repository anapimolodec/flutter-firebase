import 'package:ff/theme/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final bool isValid;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color backgroundColor; // 배경색을 위한 새로운 속성
  final Color titleColor; // 타이틀 색상을 위한 새로운 속성

  Button({
    required this.text,
    required this.isValid,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor = AppColors.blue, // 기본값 설정
    this.titleColor = Colors.white, // 기본값 설정
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed:
              widget.isValid && !widget.isLoading ? widget.onPressed : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.grey; // Disabled color
                }
                return widget.backgroundColor; // 사용 주입된 배경색
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0), // Rounded corners
              ),
            ),
            elevation: MaterialStateProperty.all(0), // No elevation
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontWeight: FontWeight.bold, // Bold text
                fontSize: 16,
                color: widget.titleColor, // 사용 주입된 타이틀 색상
              ),
            ),
          ),
          child: widget.isLoading
              ? const SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  widget.text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: widget.titleColor,
                    // 사용 주입된 타이틀 색상
                  ),
                ),
        ));
  }
}
