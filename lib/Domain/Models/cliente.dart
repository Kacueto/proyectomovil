class Cliente {
  Cliente({required this.id, required this.nombre});

  String id;
  String nombre;

  String get getid => id;
  String get getnombre => nombre;

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'].toString(),
      nombre: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
