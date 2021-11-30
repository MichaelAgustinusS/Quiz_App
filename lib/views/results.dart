import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/widget.dart';

class Results extends StatefulWidget {
  final int total, correct, incorrect, notattempted;
  Results({this.incorrect, this.total, this.correct, this.notattempted});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${widget.correct}/ ${widget.total}", style: TextStyle(fontSize: 25),),
              SizedBox(height: 8,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "you answered ${widget.correct} answers correctly "
                      " and ${widget.incorrect} answeres incorrectly", style: TextStyle(fontSize: 15,
                    color: Colors.grey),
                  textAlign: TextAlign.center,),
              ),
              SizedBox(height: 14,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: redButton(context: context, label:"Go to Home", buttonWidth: MediaQuery.of(context).size.width/2),)
                ],
      ),
    ),
    ),
    );
  }
}
