import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:poke/models/pokemon_model.dart';
import 'package:poke/pagina_principal.dart';

class BoasVindas extends StatelessWidget {

  const BoasVindas();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: PaginaPrincipal(pokeApi: PokeApi(),),
      splash: Lottie.network(
          'https://assets5.lottiefiles.com/packages/lf20_iwmd6pyr.json'),
      backgroundColor: Colors.black,
      duration: 3500,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
