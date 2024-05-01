class Soporte {
  Soporte(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  int id;
  String name;
  String email;
  int password;
  
  int get getid => id;
  String get getnombre => name;
  String get getemail => email;
  int get getpassword => password;

  factory Soporte.fromJson(Map<String, dynamic> json) {
    return Soporte(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

}
