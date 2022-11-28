import "package:flutter/material.dart";
import 'package:notas_app/pages/pages.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ModalNuevaNota extends StatefulWidget {
  @override
  State<ModalNuevaNota> createState() => _ModalNuevaNotaState();
}

class _ModalNuevaNotaState extends State<ModalNuevaNota> {
  final _tituloController = TextEditingController();

  final _contenidoController = TextEditingController();

  final _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        color: blanco,
        child: Form(
          key: _formularioKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _tituloController,
                  decoration:
                      const InputDecoration(labelText: 'Titulo de la nota'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _contenidoController,
                  decoration: const InputDecoration(labelText: 'Contenido'),
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formularioKey.currentState!.validate()) {
                          //* 1.-Agregar esto a la base de datos
                          bool respuesta = await Provider.of<AppState>(context,
                                  listen: false)
                              .saveNotas(_tituloController.text,
                                  _contenidoController.text);
                          // await UserServices().saveNotas(_tituloController.text,
                          //     _contenidoController.text);

                          if (respuesta) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Nota agregada correctamente'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            Navigator.pop;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Algo salió mal'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                          //* 2.-Regresar al usuario a la pantalla anterior
                          //* 3.-Mostrar un mensaje de lo ocurrido al usuario

                        }
                        // Navigator.pop(context);
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text('Nota agregada correctamente'),
                        //   ),
                        // );
                      },
                      child: const Text('Aceptar'),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _contenidoController.dispose();
    _tituloController.dispose();
    super.dispose();
  }
}
