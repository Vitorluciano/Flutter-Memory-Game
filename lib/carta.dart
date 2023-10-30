import 'package:flutter/material.dart';

class Carta extends StatefulWidget {
  final String tipo;
  final String conteudo;
  static const String verso = "";

  const Carta({super.key, required this.conteudo, required this.tipo});

  

  @override
  State<Carta> createState() => _CartaState();
}

class _CartaState extends State<Carta> {
  bool revelada = false;
  bool bloqueada = false;
  String faceCima = Carta.verso;

  @override
  Widget build(BuildContext context) {
    if (widget.tipo=="número") {
      return GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          color: Colors.lightBlueAccent,
          child: Center(child: Text(faceCima)),
        ),
        onTap: () {
          if (!bloqueada) {
            setState(() {
              if (!revelada) {
                faceCima = widget.conteudo;
              } else if (revelada) {
                faceCima = Carta.verso;
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
            child: Image.asset(faceCima)
          ),
        ),
        onTap: () {
          if (!bloqueada) {
            setState(() {
              if (!revelada) {
                faceCima = widget.conteudo;
              } else if (revelada) {
                faceCima = Carta.verso;
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