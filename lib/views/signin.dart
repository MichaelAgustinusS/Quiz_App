import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/helper/functions.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/views/home.dart';
import 'package:quiz_app/views/signup.dart';
import 'package:quiz_app/widgets/widget.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  String email, password;
  AuthService authService = new AuthService();
  bool isLoading = false;

  signIn() async{
    if(_formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      await authService.signInEmailAndPass(email, password).then((val){
        if(val != null){
          setState(() {
            isLoading = false;
          });
          HelperFunctions.saveUserLoggedInDetails(isLoggedin: true);
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Home()));
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
      body: isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        )

      ):Form(
        key: _formKey,
        child:Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Spacer(),
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
                signIn();
              },
              child: redButton(
                  context: context,
                  label: "SignIn"
              ),
            ),

            SizedBox(height: 18,),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an Account?", style: TextStyle(fontSize: 15.5),),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => SignUp()
                  ));
                },
              child: Text("Sign Up",style: TextStyle(fontSize: 15.5, color: Colors.red),))
            ],
            ),
            SizedBox(height: 80,)
          ],),
        ),
      ),
    );
  }
}
