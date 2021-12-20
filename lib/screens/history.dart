
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatefulWidget{
  const HistoryPage({Key? key}) : super(key: key);
@override
  State createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage>{
  final Stream<QuerySnapshot> history =
  FirebaseFirestore.instance.collection('calculation').snapshots();

  void uuenda(){
    setState(() {
      (context as Element).reassemble();
    });
  }

 @override 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Ajalugu"),
        ),

      body:
        Container(
        height: 500,
         padding: const EdgeInsets.symmetric(vertical: 40),
         child: StreamBuilder<QuerySnapshot>(
           stream: history,
           builder: (BuildContext context,
           AsyncSnapshot<QuerySnapshot> snapshot) {
           if (snapshot.hasError) {
           return Text('Something went wrong.');
           }
           if (snapshot.connectionState == ConnectionState.waiting) {
           return Text('Loading');
           }

           final data = snapshot.requireData;

           return ListView.builder(
           itemCount: data.size,
           itemBuilder: (context, index) {
           return Text(' ${data.docs[index]['tulemusX']} ',
           style: TextStyle(
           color: Colors.grey,
           fontSize: 20.0,
           ),);
            },
           );
         },
        ),
       ),
    );
  }
}
  