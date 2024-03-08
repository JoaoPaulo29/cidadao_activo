import 'dart:io';

import 'package:cidadao_activo/models/ocurrency_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class OcorrencyService {
  final FirebaseFirestore _firebaseFirestores = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  Future<bool> register(OcurrencyModel currencyModel) async {
    try {
      await _firebaseFirestores
          .collection('ocorrencies')
          .doc(currencyModel.id)
          .set({
        'id': currencyModel.id,
        'designation': currencyModel.designation,
        'description': currencyModel.description,
        'hora': currencyModel.hora
            .toString(), // Convertendo para String por ser do tipo TimeOfDay
        'data': currencyModel
            .data, // Já é do tipo DateTime, pode ser salvo diretamente
        'local': currencyModel.local,
        'foto': currencyModel.foto,
        'user': {
          'id': currencyModel.user.id,
          'name': currencyModel.user.name,
          'email': currencyModel.user.email,
          'photoUrl': currencyModel.user.photoUrl,
          // Adicione outros campos do usuário conforme necessário
        },
      });
      return true;
    } catch (e) {
      print('Erro ao registrar ocorrência: $e');
      return false;
    }
  } 
Future<String> uploadFoto(File foto, String ocurrencyId) async {
  try {
    
    Reference ref = storage.ref().child('ocorrencias').child('$ocurrencyId.jpg');
    UploadTask uploadTask = ref.putFile(foto);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  } catch (e) {
    print('Erro ao fazer upload da foto: $e');
    rethrow; // Reenvia a exceção para que possa ser tratada pelo método chamador
  }
}

}
