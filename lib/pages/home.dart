import 'package:flutter/material.dart';
import 'package:notas_app/pages/pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Nota> misNotas = [
    Nota(titulo: 'Titulo 1', contenido: 'Contenido de la nota número 1'),
    Nota(titulo: 'Titulo 2', contenido: 'Contenido de la nota número 2'),
    Nota(titulo: 'Titulo 3', contenido: 'Contenido de la nota número 3'),
    Nota(titulo: 'Titulo 4', contenido: 'Contenido de la nota número 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ModalNuevaNota();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          for (Nota nota in misNotas)
            ListTile(
              title: Text(nota.titulo!),
              subtitle: Text(nota.contenido!),
            )
        ],
      ),
    );
  }
}

class ModalNuevaNota extends StatefulWidget {
  @override
  State<ModalNuevaNota> createState() => _ModalNuevaNotaState();
}

class _ModalNuevaNotaState extends State<ModalNuevaNota> {
  final TextEditingController _tituloController = TextEditingController();

  final TextEditingController _contenidoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      color: blanco,
      child: Form(
          child: Column(
        children: [
          TextFormField(
            controller: _tituloController,
            decoration: const InputDecoration(labelText: 'Titulo de la nota'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Contenido'),
            maxLines: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Nota agregada correctamente'),
                    ),
                  );
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
      )),
    );
  }

  @override
  void dispose() {
    _contenidoController.dispose();
    _tituloController.dispose();
    super.dispose();
  }
}
