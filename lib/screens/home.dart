import 'package:flutter/material.dart';
import 'package:jogo_da_forca_flutter/screens/game.dart';

class HomeWiget extends StatelessWidget {
  const HomeWiget({super.key});

  final AssetImage background = const AssetImage("images/background.png");
  final Image forca = const Image(image: AssetImage("images/forca-icone.png"));
  final Text title = const Text("Jogo da Forca", style: TextStyle(fontSize: 40));
  
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
                  margin: const EdgeInsets.only(top: 60),
                  child: Center(child: forca),
                ),
                Center(
                  child: IconButton(
                    icon: Image.asset('images/botao-jogar.png'),
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
}