import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz_app/ResultsPage.dart';

//class to access json data
// ignore: must_be_immutable
class GetJson extends StatelessWidget {
  //String categoryName;
  //GetJson(this.categoryName);
  String fileToLoad = "";

  //sets the file name to a certain JSON file and opens it
  setFile() {
    fileToLoad = "assets/sports.json";
  }

  @override
  Widget build(BuildContext context) {
    setFile();
    //load and decode the JSON data
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(fileToLoad, cache: false),
      builder: (context, snapshot) {
        List myData = json.decode(snapshot.data.toString());

        // ignore: unnecessary_null_comparison
        if (myData == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return ShowQuestion(myData: myData);
        }
      },
    );
  }
}

//Template page to display quiz questions
class ShowQuestion extends StatefulWidget {
  final List myData;

  ShowQuestion({Key? key, required this.myData}) : super(key: key);

  @override
  _ShowQuestionState createState() => _ShowQuestionState(myData);
}

class _ShowQuestionState extends State<ShowQuestion> {
  final List myData;

  var icon;
  _ShowQuestionState(this.myData);

  Color selected = Colors.blueAccent;

  //map to help change individual button colors
  Map<String, Color> btnColor = {
    'a': Colors.white,
    "b": Colors.white,
    "c": Colors.white,
    "d": Colors.white,
  };

  bool clicked = false; //toggles button click
  int questionNum = 1; //Used for indexing questions

  //moves to next question
  void nextQuestion() {
    setState(() {
      if (questionNum < 10) {
        questionNum++;

        clicked = !clicked;

        //Reset option colors to white
        btnColor["a"] = Colors.white;
        btnColor["b"] = Colors.white;
        btnColor["c"] = Colors.white;
        btnColor["d"] = Colors.white;
      }

      //Show results page
      else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ShowResults(quizScore: score)));
      }
    });
  }

  int score = 0;

  void checkAnswer(String ans) {
    //Increase score which each correct answer
      if (myData[2][questionNum.toString()] == myData[1][questionNum.toString()][ans]) {
        score++;
      }

    setState(() {
      btnColor[ans] = selected;
      clicked = !clicked;
    });
  }

  Widget answerOption(String ans) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      //Answer options
      child: MaterialButton(
        onPressed: () {
          checkAnswer(ans);
          //ensures that user can change answer choice
          if (clicked)
            btnColor[ans] = selected;
          else
            btnColor[ans] = Colors.white;
        },
        child: Text(myData[1][questionNum.toString()][ans],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        color: btnColor[ans],
        height: 75,
        minWidth: 600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[600],

      //Question and answer options
      body: Center(
        child: Column(
          children: <Widget>[
            //Show quiz progress
            Padding(padding: EdgeInsets.only(top: 20)),
            Text('$questionNum' + ' / 10',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),

            const SizedBox(height: 32),
            Padding(padding: EdgeInsets.only(top: 40)),
            Text(myData[0][questionNum.toString()],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Padding(padding: EdgeInsets.all(45)),

            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    answerOption("a"),
                    answerOption("b"),
                    answerOption("c"),
                    answerOption("d"),

                    //Button to go to next question
                    IconButton(
                      iconSize: 55, //Resizes selection area around btn
                      onPressed: () {
                        nextQuestion();
                      },
                      icon: Icon(Icons.arrow_right, size: 55),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
