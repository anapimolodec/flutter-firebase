import 'package:ff/models/user.dart';
import 'package:ff/screens/authenticate/authenticate.dart';
import 'package:ff/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final user = Provider.of<MyUser>(context);
    // return either the Home or Authenticate widget
    if (user.uid == '') {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
