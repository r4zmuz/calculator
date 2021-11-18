

import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override 
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  num num1 = 0, num2 = 0, sum = 0;

  final TextEditingController sisend1 = TextEditingController(); //loome controlleri, et saaks sisestatud numbri katte, vaikevaartusega 0
  final TextEditingController sisend2 = TextEditingController(); //loome controlleri, et saaks sisestatud numbri katte, vaikevaartusega 0
  
  void liitmine(){
    setState(() {
      num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= num1 + num2;
    });
  }

  void lahutamine(){
    setState(() {
      num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= num1 - num2;
    });
  }

  void korrutamine(){
    setState(() {
      num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= num1 * num2;
    });
  }

  void jagamine(){
    setState(() {
      num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= num1 ~/ num2; // konverteerin double tekkiva vaartuse int-ks ~ abil
    });
  }
  void power(){
    setState(() {
     num1 = int.parse(sisend1.text); //votame sisendid
      num2 = int.parse(sisend2.text); // votame sisendid
      sum= pow(num1, num2);
    });
  }

  void kustutamine(){ // tekitame funktsiooni, mis nullib koik vaartused.
    setState(() {
      num1 = 0; 
      num2 = 0; 
      sum= 0; 
      sisend1.text = "";
      sisend2.text = "";
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
              Text("Tulemus: $sum",
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
                     child: Text("C"),
                     color: Colors.red,
                     ),
                    ], 
                )
            ],
          ),
        ),
      );
  }
}