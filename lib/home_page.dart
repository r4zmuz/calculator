import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_calculator/konverter.dart';
import 'package:flutter_calculator/history.dart';

class HomePage extends StatefulWidget{
  @override 
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  num num1 = 0, num2 = 0, sum = 0;
  var tulemusX = "";

  final TextEditingController sisend1 = TextEditingController(); //loome controlleri, et saaks sisestatud numbri katte, vaikevaartusega 0
  final TextEditingController sisend2 = TextEditingController(); //loome controlleri, et saaks sisestatud numbri katte, vaikevaartusega 0
  
  void liitmine(){
    setState(() {
      num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= num1 + num2;
      tulemusX = "Tulemus: " + sum.toString();
    });
  }

  void lahutamine(){
    setState(() {
      num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= num1 - num2;
      tulemusX = "Tulemus: " + sum.toString();
    });
  }

  void korrutamine(){
    setState(() {
      num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= num1 * num2;
      tulemusX = "Tulemus: " + sum.toString();
    });
  }

  void jagamine(){
    setState(() {
      num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= num1 ~/ num2; // konverteerin double tekkiva vaartuse int-ks ~ abil
      tulemusX = "Tulemus: " + sum.toString();
    });
  }
  void power(){
    setState(() {
     num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= pow(num1, num2);
      tulemusX = "Tulemus: " + sum.toString();
    });
  }

  void kustutamine(){ // tekitame funktsiooni, mis nullib koik vaartused.
    setState(() {
      num1 = 0; 
      num2 = 0; 
      sum= 0; 
      sisend1.text = "";
      sisend2.text = "";
      tulemusX = "";
    });
  }


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Kalkulaator"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget> [
              Text("$tulemusX",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Sisestage esimene number"
                ),
                controller: sisend1, // kasutame sisendi controllerit
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Sisestage teine number"
                ),
                controller: sisend2, // kasutame sisendi controllerit
              ),
              Padding(padding: const EdgeInsets.only(top: 20.0)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   MaterialButton(
                     onPressed: liitmine, // anname nupu vajutusel funktsiooni
                     child: Text("+"),
                     color: Colors.lightBlue.shade300,
                     ),
                     MaterialButton(
                     onPressed: lahutamine, // anname nupu vajutusel funktsiooni
                     child: Text("-"),
                     color: Colors.lightBlue.shade300,
                     ),
                    
                ],
              ),
              Padding (padding: const EdgeInsets.only(top: 20.0)
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   MaterialButton(
                     onPressed: korrutamine, // anname nupu vajutusel funktsiooni
                     child: Text("*"),
                     color: Colors.lightBlue.shade300,
                     ),
                     MaterialButton(
                     onPressed: jagamine, // anname nupu vajutusel funktsiooni
                     child: Text("/"),
                     color: Colors.lightBlue.shade300,
                     ),
                ],
              ),
              Padding (padding: const EdgeInsets.only(top: 20.0)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      MaterialButton(
                     onPressed: power, // anname nupu vajutusel funktsiooni
                     child: Text("^"),
                     color: Colors.lightBlue.shade300,
                     ),
                   MaterialButton(
                     onPressed: kustutamine, // anname nupu vajutusel funktsiooni
                     child: Text("Tühjenda"),
                     color: Colors.red,
                     ),
                    ], 
                ),
                Padding(padding: const EdgeInsets.only(top: 20.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                     onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConverterPage()),
                      );
                    }, // anname nupu vajutusel funktsiooni
                     child: Text("Konverteerimine"),
                     color: Colors.lightGreen,
                     ),
                  ],
                ),
                Padding(padding: const EdgeInsets.only(top: 20.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                     onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryPage()),
                      );
                    }, // anname nupu vajutusel funktsiooni
                     child: Text("Ajalugu"),
                     color: Colors.blueGrey,
                     ),
                  ],
                ),
            ],
          ),
        ),
      );
  }
}