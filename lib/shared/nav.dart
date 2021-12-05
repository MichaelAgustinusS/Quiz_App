import 'package:flutter/material.dart';
import 'package:quiz_app/views/home.dart';
import 'package:quiz_app/views/nilai_akm.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Soal AKM'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              ListTile(
                title: Text('Nilai AKM'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => nilaiAkm()));
                },
              ),
            ]
        )
    );
  }
}
