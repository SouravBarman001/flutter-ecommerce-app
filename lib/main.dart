import 'package:flutter/material.dart';

import 'features/authentication/sign_in/presentation/pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:Colors.white,
        fontFamily: 'DM Sans',
      ),
      home:  const SignInPage(),// MyHomePage(),
    );
  }
}

