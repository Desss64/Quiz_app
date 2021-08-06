import 'package:flutter/material.dart';
import 'categoryPage.dart';

void main() {
  runApp(MyApp());
}

//ROOT widget
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

//Starting page
class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    //Sytling for start button
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
        primary: Colors.blueAccent[700],
        minimumSize: Size(120, 40),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30)));

    return Container(
      child: Column(
        //Centers button
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          //App title text
          Text(
            'QuizMe!',
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                height: 3),
          ),

          //Start button
          ElevatedButton(
            style: style,
            //Goes to next screen after start button is clicked
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CategoryScreen()));
            },
            child: const Text('Start'),
          ),
          const SizedBox(height: 30, width: 100),
        ],
      ),
      color: Colors.orange,
    );
  }
}
