import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_calculator/models/sharedpref_history.dart';
import 'dart:convert';

class SharedPreferencesController {
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeData(Tulemused arvTulemused) async {
    prefs.setString(arvTulemused.id.toString(), json.encode(arvTulemused.toJson()));
  }

  List<Tulemused> getData(){
    List<Tulemused> data = [];
    Set<String> keys = prefs.getKeys();
    keys.forEach((String key) {
      if (key != 'counter') {
        Tulemused arvTulemused = Tulemused.fromJson(
            json.decode(prefs.getString(key) ?? ''));
        data.add(arvTulemused);
      }
    });
    return data;
  }

  Future setCounter() async {
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    await prefs.setInt('counter', counter);
  }

  int getCounter(){
    return prefs.getInt('counter')?? 0;

  }

}