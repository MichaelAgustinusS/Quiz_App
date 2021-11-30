import 'package:flutter/material.dart';
import 'package:quiz_app/helper/functions.dart';
import 'package:quiz_app/views/home.dart';
import 'package:quiz_app/views/signin.dart';
import 'package:quiz_app/views/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedin = false;

  @override
  void initState() {
    checkUserLoggedInStatus();
    super.initState();
  }
  checkUserLoggedInStatus()async{
    HelperFunctions.getUserLoggedInDetails().then((value){
      setState(() {
        _isLoggedin = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLoggedin ?? false) ? Home() : SignIn(),
    );
  }
}
