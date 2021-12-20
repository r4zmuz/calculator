
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget{
  const ConverterPage({Key? key}) : super(key: key);
@override
  State createState() => ConverterPageState();
}

class ConverterPageState extends State<ConverterPage>{

num kNum = 0, kSum = 0;
var tulemus = "";

final TextEditingController kSisend = TextEditingController();

void kilomeeter(){
  setState(() {
    kNum = int.parse(kSisend.text);
    kSum = kNum * 1.609;
    tulemus = "Tulemus: " + kSum.toString()+" km";
  });
}

void miil(){
  setState(() {
    kNum = int.parse(kSisend.text);
    kSum = kNum * 0.621;
    tulemus = "Tulemus: " + kSum.toString()+" miles";
  });
}

void tyhjendamine(){ // tekitame funktsiooni, mis nullib koik vaartused.
    setState(() {
      kNum = 0;  
      kSum= 0; 
      kSisend.text = "";
      tulemus = "";
    });
  }

 @override 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Konverteerija"),
        ),
        body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget> [
              Text("$tulemus",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
          ), 
            TextField(
                 keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Sisestage number"
                ),
                controller: kSisend,
              ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                     onPressed: miil, // anname nupu vajutusel funktsiooni
                     child: Text("Miilideks"),
                     color: Colors.lightBlue.shade300,
                     ),
               MaterialButton(
                     onPressed: kilomeeter, // anname nupu vajutusel funktsiooni
                     child: Text("kilomeetriteks"),
                     color: Colors.lightBlue.shade300,
                     ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                     onPressed: tyhjendamine, // anname nupu vajutusel funktsiooni
                     child: Text("Tühjendamine"),
                     color: Colors.red,
                     ),
            ],
          ),
         ], 
        ),
      ),
    );
  }
}
  