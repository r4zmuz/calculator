import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/controllers/shared_preferences_controller.dart';
import 'package:flutter_calculator/models/sharedpref_history.dart';


class HistoryPagePref extends StatefulWidget {
  const HistoryPagePref({Key? key}) : super(key: key);

  @override
  _HistoryPagePrefState createState() => _HistoryPagePrefState();
}

class _HistoryPagePrefState extends State<HistoryPagePref> {

  List<Tulemused> tulemus = [];
  final SharedPreferencesController tulemusSp = SharedPreferencesController();

  @override
  void initState() {
    tulemusSp.init().then((value) {uuenda();});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator history'),
      ),
      body: ListView(children: getContent()),
    );
  }

  List<Widget> getContent(){
    List<Widget> row = [];
    tulemus.forEach((a) {
      row.add(ListTile(
        title: Text('Timestamp: ${a.time}'), //aeg
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${a.summa.toStringAsFixed(2)}') //summa pluss 2 kohta
          ],
        ),
      ));
    });
    return row;
  }

  void uuenda(){
    tulemus = tulemusSp.getData(); // kogu info salvestatud Sp
    setState(() {

    });

  }
}