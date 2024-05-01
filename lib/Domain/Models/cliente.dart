class Cliente {
  Cliente({required this.id, required this.name});

  int id;
  String name;

  int get getid => id;
  String get getnombre => name;

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
