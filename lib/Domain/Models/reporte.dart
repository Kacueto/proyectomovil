

class Reporte {
  Reporte(
      {required this.id,
      required this.body,
      required this.grade,
      required this.title,
      required this.duration,
      required this.isGraded,
      required this.idCliente,
      required this.idSoporte,
      required this.starTime,
      required this.nameSoporte});
  
  int id;
  String body;
  int grade;
  String title;
  int duration;
  bool isGraded;
  int idCliente;
  int idSoporte;
  String starTime;
  String nameSoporte;

  int get getid => id;
  String get getbody => body;
  int get getgrade => grade;
  String get gettitle => title;
  int get getduration => duration;
  bool get getisGraded => isGraded;
  int get getidCliente => idCliente;
  int get getidSoporte => idSoporte;
  String get getstarTime => starTime;
  String get getnameSoporte => nameSoporte;
  
  factory Reporte.fromJson(Map<String, dynamic> json) {
  return Reporte(
    id: json['id'] ?? 0,
    body: json['body'] ?? '',
    grade: json['grade'] ?? 0,
    title: json['title'] ?? '',
    duration: json['duration'] ?? 0,
    isGraded: json['isGraded'] ?? false,
    idCliente: json['idCliente'] ?? 0,
    idSoporte: json['idSoporte'] ?? 0,
    starTime: json['starTime'] ?? '',
    nameSoporte: json['nameSoporte'] ?? '',
  );
}

  
  

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'body': body,
      'grade': grade,
      'title': title,
      'duration': duration,
      'isGraded': isGraded,
      'idCliente': idCliente,
      'idSoporte': idSoporte,
      'starTime': starTime,
      'nameSoporte': nameSoporte,
    };
  }
}


