
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget{
  const HistoryPage({Key? key}) : super(key: key);
@override
  State createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage>{


 @override 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Ajalugu"),
        ),
        body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget> [
              Text("AJALUGU",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ), 
          ],
        ),  
      ),
    );
  }
}
  