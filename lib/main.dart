import 'package:flutter/material.dart';
import 'package:notas_app/pages/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //* Todos los hijos que le sigan a ChangeNotifierProvider estaran escuhando ese provider
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notas App',
        theme: miTema(context),
        routes: {
          '/': (_) => HomePage(),
          'nuevo': (_) => ModalNuevaNota(),
        },
        initialRoute: '/',
      ),
    );
  }
}
