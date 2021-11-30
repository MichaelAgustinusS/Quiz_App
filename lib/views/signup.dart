import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/services/database.dart';
import 'package:quiz_app/views/home.dart';
import 'package:quiz_app/views/signin.dart';
import 'package:quiz_app/widgets/widget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name, email, password;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async{
    if (_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      authService.signUpWithEmailAndPassword(email, password).then((val) {
        if (val != null) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Home()
          ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: appBar(context),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
        ),
      body: _isLoading ? Container(
        child: Center(child: CircularProgressIndicator(),),
      ):Form(
        key: _formKey,
        child:Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Your Name" :null;
                },
                decoration: InputDecoration(hintText: "Name"),
                onChanged: (val){
                  name = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "Enter Email ID" :null;
                },
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                obscureText: true,
                validator: (val) {
                  return val.isEmpty ? "Enter Password" : null;
                },
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (val){
                  password = val;
                },
              ),
              SizedBox(height: 24,),
              GestureDetector(
                onTap: (){
                  signUp();
                },
                child: redButton(
                    context: context,
                    label: "SignUp"
                ),
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account?", style: TextStyle(fontSize: 15.5),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => SignIn()
                      ));
                    },
                    child: Text("Sign In",style: TextStyle(fontSize: 15.5, color: Colors.red),),
                  )],
              ),

              SizedBox(height: 80,)
            ],),
        ),
      ),
    );
  }
}
