import 'package:flutter/material.dart';
import 'package:jogo_memoria/carta.dart';

class Baralho extends StatefulWidget {
  final List<Carta> cartas;

  const Baralho({super.key, required this.cartas});

  @override
  State<Baralho> createState() => _BaralhoState();
}

class _BaralhoState extends State<Baralho> {
  int numCartasReveladas = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: widget.cartas,
    );
  }
}