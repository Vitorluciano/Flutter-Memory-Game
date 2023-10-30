import 'package:flutter/material.dart';
import 'package:jogo_memoria/arguments.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool? _imgCheckbox = false, _numCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jogo da Memória")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text("Apelido:", style: TextStyle(fontSize: 30)),
                TextField(
                  
                ),
              ]

            ),
            Column(
              children: [
                const Text(
                  "Tipo:",
                  style: TextStyle(fontSize: 30)
                ),
                CheckboxListTile(
                  title: const Text("Imagem"),
                  value: _imgCheckbox, 
                  onChanged: (bool? val) {
                    setState(() {
                      _imgCheckbox = val;
                    });
                  }
                ),
                CheckboxListTile(
                  title: const Text("Número"),
                  value: _numCheckbox, 
                  onChanged: (bool? val) {
                    setState(() {
                      _numCheckbox = val;
                    });
                  }
                ),
              ]
            ),
            ElevatedButton(
              onPressed: () {
                if (_imgCheckbox==false && _numCheckbox==false) {
                  //mostrar mensagem de erro
                } else {
                  String modo = "";
                  if (_imgCheckbox==true && _numCheckbox==true) {
                    modo = "misto"; //cartas mistas (imagens e numeros)
                  } else if (_imgCheckbox==true) {
                    modo = "imagem"; //somentos imagens
                  } else if (_numCheckbox==true) {
                    modo = "número"; //somente números
                  }
                  Navigator.pushNamed(
                  context,
                  "/jogo",
                  arguments: Arguments(modo) 
                );
                }
              }, 
              child: const Text("Iniciar")
            )
          ],
        )
      )
    );
  }
}