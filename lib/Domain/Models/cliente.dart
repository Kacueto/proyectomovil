class Cliente {
  Cliente({required this.id, required this.nombre});

  final String id;
  final String nombre;

  String get getid => id;
  String get getnombre => nombre;

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      nombre: json['nombre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
