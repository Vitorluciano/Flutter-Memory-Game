import 'package:flutter/material.dart';

class Carta extends StatefulWidget {
  final String tipo;
  final String conteudo;
  final Widget verso;

  const Carta({super.key, required this.conteudo, required this.tipo, required this.verso});


  @override
  State<Carta> createState() => _CartaState();
}

class _CartaState extends State<Carta> {
  bool revelada = false;
  bool bloqueada = false;
  Widget faceCima = const Text("");

  @override
  Widget build(BuildContext context) {
    if (widget.tipo=="número") {
      return GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          color: Colors.lightBlueAccent,
          child: Center(child: faceCima),
        ),
        onTap: () {
          if (!bloqueada) {
            setState(() {
              if (!revelada) {
                faceCima = Text(widget.conteudo);
              } else if (revelada) {
                faceCima = const Text("");
              }
              revelada = !revelada;
            }
            );
          }
        },
      );
    } else if (widget.tipo=="imagem") {
      return GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          color: Colors.lightBlueAccent,
          child: FittedBox(
            fit: BoxFit.fill,
            child: faceCima
          ),
        ),
        onTap: () {
          if (!bloqueada) {
            setState(() {
              if (!revelada) {
                faceCima = Image.asset(widget.conteudo);
              } else if (revelada) {
                faceCima = const Text("");
              }
              revelada = !revelada;
            }
            );
          }
        },
      );
    }
    //gambiarra, corrigir depois
    return GestureDetector();
  }
}