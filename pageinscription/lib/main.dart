import 'package:flutter/material.dart';
import 'package:pageinscription/accueil.dart';
import 'package:pageinscription/form.dart';
import 'package:pageinscription/formulaire.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
     // home: const Accueil(),
      initialRoute: '/',
      routes: {
        '/':(context)=>const Accueil(),
        Formulaire.routName:(context)=>const Formulaire(),
        Fo.routName :(context)=>const Fo()
      },
    );
  }
}

