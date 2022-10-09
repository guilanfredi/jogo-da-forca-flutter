import 'package:flutter/material.dart';

import 'game.dart';

class End extends StatelessWidget {
  End({super.key, required this.venceu, required this.palavra});

  final bool venceu;
  final String palavra; 


  final AssetImage background = const AssetImage("images/background.png");

  final Text title = const Text("PARABÉNS", style: TextStyle(fontSize: 40, color: Colors.green));
  final Text titlePerdeu = const Text("Não foi dessa vez", style: TextStyle(fontSize: 35, color: Colors.red));

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
                  child: Center(child: venceu ? title : titlePerdeu),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 96),
                  child: frase,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: buildPalavra(palavra)
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