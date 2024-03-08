import 'package:cidadao_activo/models/user_model.dart';

class OcurrencyModel {
  final String id;
  final String designation;
  final String description;
  final String hora;
  final DateTime data;
  final String local;
  final String? foto;
  final UserModel user;

  OcurrencyModel({
    required this.id,
    required this.description,
    required this.hora,
    required this.data,
    required this.local,
    this.foto,
    required this.designation,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'designation': designation,
      'hora': hora,
      'data': data,
      'foto': foto,
      'local': local,
      'user': user,
    };
  }
}
