import 'package:flutter/material.dart';

import 'end.dart';

class Game extends StatefulWidget {
  const Game({super.key});
  
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  
  final AssetImage background = const AssetImage("images/background.png");
  final Image forca = const Image(image: AssetImage("images/forca.png"));
  final Image cabeca = const Image(image: AssetImage("images/cabeca.png"));
  final Image corpo = const Image(image: AssetImage("images/corpo.png"));
  final Image bracoEsquerdo = const Image(image: AssetImage("images/braco-esquerdo.png"));
  final Image bracoDireito = const Image(image: AssetImage("images/braco-direito.png"));
  final Image pernaEsquerda = const Image(image: AssetImage("images/perna-esquerda.png"));
  final Image pernaDireita = const Image(image: AssetImage("images/perna-direita.png"));
  final Image xis = const Image(image: AssetImage("images/red-cross.png"));


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
            Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: buildForca(4),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: buildPalavra("Guilherme")
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 96),
                    child: buildTeclado([65, 66, 68])
                  ),
                ]
              ),
            )
            
          ],
        )
      )
    );
  }

  Widget buildForca(int attempts){
    List<Widget> array = 
      [forca, cabeca, corpo, bracoDireito, bracoEsquerdo, pernaDireita, pernaEsquerda];
    return Stack(
      children: array.sublist(0, attempts > array.length - 1 ? array.length : attempts + 1),
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

  Widget buildTeclado(List<int> letrasTestadas){

    List<Widget> buttons = [];
    //A = 65, Z = 90
    for(int i=65; i<=90; i++){
      buttons.add(
        Stack(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
                side: const BorderSide(color: Colors.black, width: 2),
                minimumSize: const Size(42, 42),
                padding: EdgeInsets.zero,
              ),
              onPressed: letrasTestadas.contains(i) ? null : () => {
                // ...
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const End()),
                )
              },
              child: Text(String.fromCharCode(i)),
            ),
            letrasTestadas.contains(i) ?
              Container(
                margin: const EdgeInsets.only(top: 4, left: 4),
                child: xis,
              ) : Container()
          ],
        )
        
        
      );
    }



    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttons.sublist(0, 7),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttons.sublist(7, 14),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttons.sublist(14, 21),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttons.sublist(21, 26),
      ),
    ]);
  }
}