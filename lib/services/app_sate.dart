

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:notas_app/pages/pages.dart';

//* Con esto la clase ya puede ser usada como provider
class AppState with ChangeNotifier {
  List<Nota> _notas = [];

  Future<bool> saveNotas(String text, String text2) async {
    try {
      bool respuesta = await UserServices().saveNotas(
        text,
        text2,
      );
      if (respuesta) {
        notifyListeners();
      }
      return respuesta;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Nota>> obtenerNotas() async {
    Map<String, dynamic> values;
    try {
      _notas = await UserServices().getNotas();

      return _notas;
    } catch (e) {
      print("Error");
      return _notas;
    }
  }
}
