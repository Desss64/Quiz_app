import 'package:flutter/material.dart';
import 'questionScreen.dart';

//Page to display categories for a quiz
class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ButtonStyle catStyle = ElevatedButton.styleFrom(
      primary: Colors.orange[400],
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30)),
      textStyle: TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900], //Colors.indigoAccent,
        body: GridView.count(
          crossAxisCount: 4, //Number of boxes in each row
          padding: const EdgeInsets.all(20), //Spacing between each box
          crossAxisSpacing: 30,
          mainAxisSpacing: 50,

          //Category buttons
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GetJson()));
                },
                child: Text('Sports'),
                style: catStyle),
          ],
        ));
  }
}