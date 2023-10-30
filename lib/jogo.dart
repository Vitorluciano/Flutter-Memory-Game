import 'package:flutter/material.dart';
import 'package:jogo_memoria/arguments.dart';
import 'package:jogo_memoria/carta.dart';

class Jogo extends StatefulWidget {
  final String? modo;

  const Jogo({super.key, this.modo});

  const Jogo.modo({super.key, this.modo});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  int tentativas = 0;
  List<String> numeros = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List<String> imagens = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"];
  List<Carta> baralho = [];
 

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Arguments;

    //gera uma lista de cartas de acordo com o modo do jogo
    if (args.modo == "número") {

      for (int i = 0; i < 10; i++) {
        baralho.add(Carta(tipo: "número", conteudo: numeros[i]));
        baralho.add(Carta(tipo: "número", conteudo: numeros[i]));
      }

      baralho.shuffle();
    } else if (args.modo == "imagem") {

      for (int i = 0; i < 10; i++) {
        baralho.add(Carta(tipo: "imagem", conteudo: "images/${imagens[i]}.png"));
        baralho.add(Carta(tipo: "imagem", conteudo: "images/${imagens[i]}.png"));
      }

      baralho.shuffle();
    } else if (args.modo == "misto") {
        numeros.shuffle();
        imagens.shuffle();

        for (int i = 0; i < 5; i++) {
          baralho.add(Carta(tipo: "número", conteudo: numeros[i]));
          baralho.add(Carta(tipo: "número", conteudo: numeros[i]));
        }

        for (int i = 0; i < 5; i++) {
          baralho.add(Carta(tipo: "imagem", conteudo: "images/${imagens[i]}.png"));
          baralho.add(Carta(tipo: "imagem", conteudo: "images/${imagens[i]}.png"));

        }

        baralho.shuffle();
    }

    return Scaffold(
      appBar: AppBar(title: Text("modo: ${args.modo}")),
      body: Container(
        color: const Color.fromARGB(255, 182, 221, 239),
        padding: const EdgeInsets.only(top: 150),
        child: GridView.count(
          crossAxisCount: 4,
          children: baralho
        )
      )
    );
  }
}