import 'package:flutter/material.dart';

class ShowResults extends StatefulWidget {
  final int quizScore;
  const ShowResults({ Key? key, required this.quizScore }) : super(key: key);

  @override
  _ShowResultsState createState() => _ShowResultsState(quizScore);
}

class _ShowResultsState extends State<ShowResults> {
  int finalScore;
  _ShowResultsState(this.finalScore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Text('$finalScore', style: TextStyle(fontSize: 100)),
    );
  }
}