import 'dart:convert';

class Peserta {
  final int? id;
  final String nama;
  final String email;
  final String event;
  final String kota;
  final int? phone;
  final String password;
  final String confirm;

  Peserta({
    this.id,
    required this.nama,
    required this.email,
    required this.event,
    required this.kota,
    required this.phone,
    required this.password,
    required this.confirm,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'event': event,
      'kota': kota,
      'phone': phone,
      'password': password,
      'confirm': confirm,
    };
  }

  factory Peserta.fromMap(Map<String, dynamic> map) {
    return Peserta(
      id: map['id'],
      nama: map['nama'] ?? '',
      email: map['email'] ?? '',
      event: map['event'] ?? '',
      kota: map['kota'] ?? '',
      phone: map['phone'] != null ? map['phone'] as int : 0,
      password: map['password'] ?? '',
      confirm: map['confirm'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory Peserta.fromJson(String source) =>
      Peserta.fromMap(json.decode(source) as Map<String, dynamic>);
}
