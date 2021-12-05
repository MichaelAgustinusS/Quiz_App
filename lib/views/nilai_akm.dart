import 'package:flutter/material.dart';
import 'package:quiz_app/shared/nav.dart';

class nilaiAkm extends StatefulWidget {

  @override
  _nilaiAkmState createState() => _nilaiAkmState();
}

class _nilaiAkmState extends State<nilaiAkm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      drawer: NavBar(),
      body: Container()
    );
  }
}