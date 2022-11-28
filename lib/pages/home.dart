import 'package:flutter/material.dart';
import 'package:notas_app/pages/pages.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppState? estado;
  @override
  Widget build(BuildContext context) {
    estado = Provider.of<AppState>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notas App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'nuevo');
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: estado!.obtenerNotas(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            List misnotas = snapshot.data ?? [];
            return ListView(
              children: [
                for (Nota nota in misnotas)
                  ListTile(
                    title: Text(nota.titulo!),
                    subtitle: Text(nota.contenido!),
                  ),
                Column(),
              ],
            );
          },
        ));
  }
}
