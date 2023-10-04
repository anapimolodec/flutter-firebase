import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle h1({Color color = Colors.black}) =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color);

  static TextStyle h2({Color color = Colors.black}) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color);

  static TextStyle number({Color color = Colors.black}) =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: color);

  static TextStyle button({Color color = Colors.black}) =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: color);

  static TextStyle textBold({Color color = Colors.black}) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color);

  static TextStyle text({Color color = Colors.black}) =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: color);

  static TextStyle smallText({Color color = Colors.black}) =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: color);

  static TextStyle paragraph({Color color = Colors.black}) =>
      TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: color);
}
