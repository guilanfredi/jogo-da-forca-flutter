import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'game.dart';

class End extends StatefulWidget {
  const End({super.key});

  @override
  State<End> createState() => _EndState();
}

class _EndState extends State<End> {
  final AssetImage background = const AssetImage("images/background.png");
  final Text title = const Text("PARABÉNS", style: TextStyle(fontSize: 40, color: Colors.green));
  final Text frase = const Text("A PALAVRA ERA:", style: TextStyle(fontSize: 20, color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: background, fit: BoxFit.cover,),
              ),
            ),
            
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Center(child: title),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 96),
                  child: frase,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: buildPalavra("Guilherme")
                ),
                Center(
                  child: IconButton(
                    icon: Image.asset('images/botao-jogar-novamente.png'),
                    iconSize: 300,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Game()),
                      );
                    },
                  )
                ),
              ]
            )
          ],
        )
      )
    );
  }

  Widget buildPalavra(String palavra){
    final palavraCorrigida = palavra.trim().toUpperCase().characters;
    List<Widget> widgets = [];

    for (var element in palavraCorrigida) {
      widgets.add(
        Expanded(
          child: Column(
            children: [
              Text(element,
                style: const TextStyle(
                  fontSize: 20,
                )
              ),
              const Divider(color: Colors.black, thickness: 2,indent: 2, endIndent: 2,)
            ],
          )
        )
      );
    }

    return Row(
      children: widgets,
    );
  }
}