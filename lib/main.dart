import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koen/pages/sign/onboarding.dart';
import 'package:koen/pages/sign/signin.dart';
import 'package:koen/pages/sign/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
      theme: ThemeData(),
    );
  }
}
