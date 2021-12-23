import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/controllers/shared_preferences_controller.dart';
import 'package:flutter_calculator/screens/konverter.dart';
import 'package:flutter_calculator/screens/history.dart';
import 'package:flutter_calculator/screens/shared_pref_history.dart';
import 'package:flutter_calculator/models/sharedpref_history.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget{
  @override 
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage>{


  num num1 = 0, num2 = 0, sum = 0;
  var tulemusX = '';
  final TextEditingController sisend1 = TextEditingController(); //loome controlleri, et saaks sisestatud numbri katte, vaikevaartusega 0
  final TextEditingController sisend2 = TextEditingController(); //loome controlleri, et saaks sisestatud numbri katte, vaikevaartusega 0
  final SharedPreferencesController tulemusSp = SharedPreferencesController();

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

  Future salvestamineSp() async {
    DateTime now = DateTime.now();
    String currentTime = '${now.day}.${now.month}.${now.year} ${now.hour}:${now.minute}:${now.second}';   //get current time with string interpolation
    int id = tulemusSp.getCounter() + 1;    //calls to getCounter method in calc_results_sp and adds 1
    Tulemused newResults = Tulemused(id, sum, currentTime);      //CalcResult is the model we use (calc_results_history.dart) to create object
    tulemusSp.writeData(newResults).then((_){ //call writeResult method in calc_results_sp to write data to SP. After results are written to SP, call setCounter method to update counter
      tulemusSp.setCounter();
    });

  }

  @override
  void initState() {                //when we call writeResults method, we want to make sure that SP have been initialised
    tulemusSp.init();                //initialise SP calling resultSp.init()
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    CollectionReference history =
    FirebaseFirestore.instance.collection('calculation');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Kalkulaator"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget> [
              Text('$tulemusX',
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
                     onPressed: () async {
                      liitmine();
                      salvestamineSp();
                      await history.add({
                      'tulemusX': tulemusX,
                      }).then((value) => print('Tulemus lisatud'));// anname nupu vajutusel funktsiooni
                     },
                     child: Text("+"),
                     color: Colors.lightBlue.shade300,
                     ),
                     MaterialButton(
                     onPressed: () async {
                       lahutamine();
                       salvestamineSp();
                       await history.add({
                         'tulemusX': tulemusX,
                       }).then((value) => print('Tulemus lisatud'));// anname nupu vajutusel funktsiooni
                     }, // anname nupu vajutusel funktsiooni
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
                     onPressed: () async {
                       korrutamine();
                       salvestamineSp();
                       await history.add({
                         'tulemusX': tulemusX,
                       }).then((value) => print('Tulemus lisatud'));// anname nupu vajutusel funktsiooni
                     }, // anname nupu vajutusel funktsiooni
                     child: Text("*"),
                     color: Colors.lightBlue.shade300,
                   ),
                     MaterialButton(
                       onPressed: () async {
                         jagamine();
                         salvestamineSp();
                         await history.add({
                           'tulemusX': tulemusX,
                         }).then((value) => print('Tulemus lisatud'));// anname nupu vajutusel funktsiooni
                       }, // anname nupu vajutusel funktsiooni
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
                        onPressed: () async {
                          power();
                          salvestamineSp();
                          await history.add({
                            'tulemusX': tulemusX,
                          }).then((value) => print('Tulemus lisatud'));// anname nupu vajutusel funktsiooni
                        }, // anname nupu vajutusel funktsiooni
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                     onPressed: ()  {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryPage()),
                      );
                    }, // anname nupu vajutusel funktsiooni
                     child: Text("Ajalugu"),
                     color: Colors.blueGrey,
                     ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HistoryPagePref()),
                        );
                      }, // anname nupu vajutusel funktsiooni
                      child: Text("SharedPref Ajalugu"),
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