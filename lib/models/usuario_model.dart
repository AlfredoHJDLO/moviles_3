class UsuarioModel {
  int id;
  String name;
  String email;
  String password;

  UsuarioModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory UsuarioModel.fromJSON(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {'id': id, 'name': name, 'email': email, 'password': password};
  }
}
