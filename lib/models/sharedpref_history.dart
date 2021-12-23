class Tulemused {
  int id = 0;
  num summa = 0;
  String time = '';

  Tulemused(this.id,this.summa, this.time);

  Tulemused.fromJson(Map<String,dynamic> calcResultsMap){
    id = calcResultsMap['id'] ?? 0;
    summa = calcResultsMap['summa'] ?? 0;
    time = calcResultsMap['time'] ?? '';
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'summa':summa,
      'time':time,
    };
  }
}