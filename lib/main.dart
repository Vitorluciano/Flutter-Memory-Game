import 'package:flutter/material.dart';
import 'package:jogo_memoria/arguments.dart';
import 'package:jogo_memoria/home.dart';
import 'package:jogo_memoria/jogo.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Jogo da memória",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/jogo": (context) => const Jogo()
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/jogo") {
          var args = settings.arguments as Arguments;
          
          return MaterialPageRoute(
            builder: (context) => Jogo.modo(modo: args.modo)
          );
        }
        return null;
      },
    )
  );
}