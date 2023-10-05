import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'Label.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool isError;
  final FocusNode? focusNode;
  final bool disable;
  final int maxLength;
  final bool isPassword;
  final Function(String)? onChanged;

  const Input({super.key, 
    this.isError = false,
    this.disable = false,
    this.maxLength = 200,
    this.isPassword = false,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    this.focusNode,
  });

  @override
  _Input createState() => _Input();
}

class _Input extends State<Input> {
  bool _obscureText = true;

  Color get borderColor => widget.isError ? AppColors.red : AppColors.blue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(text: widget.labelText),
        const SizedBox(height: 8),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border(
              left: BorderSide(color: borderColor),
              top: BorderSide(color: borderColor),
              bottom: BorderSide(color: borderColor),
              right: BorderSide(color: borderColor),
            ),
          ),
          child: TextField(
            onChanged: widget.onChanged,
            obscureText: widget.isPassword ? _obscureText : false,
            maxLength: widget.maxLength,
            enabled: !widget.disable,
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        color: AppColors.grey,
                        // 상태에 따라 아이콘 변경
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        // 상태 토글
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              counterText: '',
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontSize: 15, color: AppColors.grey),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
          ),
        ),
      ],
    );
  }
}
