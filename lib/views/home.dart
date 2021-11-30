import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/services/database.dart';
import 'package:quiz_app/shared/nav.dart';
import 'package:quiz_app/views/create_quiz.dart';
import 'package:quiz_app/views/play_quiz.dart';
import 'package:quiz_app/widgets/widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Container() :
          ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return QuizTile(
                  imgUrl: snapshot.data.documents[index].data["quizImgUrl"],
                  desc: snapshot.data.documents[index].data["quizDesc"],
                  title: snapshot.data.documents[index].data["quizTitle"],
                  quizId: snapshot.data.documents[index].data["quizId"],
                );
              });
        },
      ),
    );
  }
    @override
    void initState() {
    databaseService.getQuizData().then((val) {
      setState(() {
        quizStream = val;
      });
    });
    super.initState();

  }
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
      body: Container(
        child: Column(children: [
          quizList()
    ],),
    ),
floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    backgroundColor: Colors.red,
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(
      builder: (context) => CreateQuiz()));
    },
),
    );
    }
}
class QuizTile extends StatelessWidget{
  final String imgUrl;
  final String title;
  final String desc;
  final String quizId;

  QuizTile({@required this.imgUrl, @required this.title, @required this.desc, @required this.quizId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => QuizPlay(
            quizId
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 150,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imgUrl,width: MediaQuery.of(
                  context).size.width - 48, fit: BoxFit.cover,),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                  SizedBox(height: 6,),
                  Text(desc, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

