import 'package:ff/theme/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class Label extends StatelessWidget {
  final String text;
  final Color? color;

  const Label({
    Key? key,
    required this.text,
    this.color = AppColors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyles.paragraph(color: AppColors.grey),
      ),
    );
  }
}
