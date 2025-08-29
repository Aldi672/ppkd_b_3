import 'dart:convert';

class Peserta {
  final int? id;
  final String nama;
  final String email;
  final String password;
  final String confirm;

  Peserta({
    this.id,
    required this.nama,
    required this.email,
    required this.password,
    required this.confirm,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'password': password,
      'confirm': confirm,
    };
  }

  factory Peserta.fromMap(Map<String, dynamic> map) {
    return Peserta(
      id: map['id'],
      nama: map['nama'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      confirm: map['confirm'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory Peserta.fromJson(String source) =>
      Peserta.fromMap(json.decode(source) as Map<String, dynamic>);
}
