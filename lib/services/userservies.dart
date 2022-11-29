import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:notas_app/models/nota.dart';
import 'dart:convert';
import 'package:notas_app/pages/pages.dart';

import 'package:notas_app/pages/home.dart';

class UserServices {
  Future<List<Nota>> getNotas() async {
    List<Nota> misNotas = [];
    Map<String, dynamic> values;
    try {
      final snap =
          await FirebaseDatabase.instance.ref().child('notas').get().then(
        (DataSnapshot snapshot) {
          Map<String, dynamic> values =
              jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
          //snap = snap.snapshot as DataSnapshot;
          //final firstdata = snap.data! as Map<String, dynamic>;
          // DataSnapshot data2 = snap.snapshot as DataSnapshot;
          // print(values.toString());
          values.forEach(
            (k, v) {
              Map mapa = {'key': k, ...v};
              //* Tres puntos + values, crea un mapa apartir de un valor nuevo.
              Nota nuevaNota = Nota(
                contenido: mapa['body'],
                key: mapa['key'],
                titulo: mapa['title'],
              );
              misNotas.add(nuevaNota);

              // misNotas.add(nuevaNota);
              // print(nuevaNota.titulo);
              // print("KEY: $k");
              // print("VALUE $v");
            },
          );
          print("Se devolvieron las notas PRIMERA PARTE");
          print(misNotas);
          return misNotas;
        },
      );
      // print("PRUEBA");
      // // print(snap2.value);
      // // // snap2.value?.forEach((key, value) {
      // // //   print('Key: $key');
      // // //   print('Key: $key');
      // // // });

      print("Se devolvieron las notas bien");
      print(misNotas);
      return misNotas;
    } catch (e) {
      print("Error");
      return misNotas;
    }
  }

  Future<bool> saveNotas(String titulo, String contenido) async {
    try {
      await FirebaseDatabase.instance.ref().child("notas").push().set({
        'title': titulo,
        'body': contenido,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> eliminarNota(String key) async {
    try {
      await FirebaseDatabase.instance.ref().child('notas').child(key).remove();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
