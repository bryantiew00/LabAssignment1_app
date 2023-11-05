import 'dart:async';
import 'package:flutter/material.dart';
import 'loancalc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Boit Loan Calculator',
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: const SplashPage());
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (content) => const LoanCalcPage())));
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/images/Financial.png', scale: 1)],
      ),
    ),
  );
}
}