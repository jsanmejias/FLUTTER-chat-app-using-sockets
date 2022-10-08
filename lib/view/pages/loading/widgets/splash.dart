import 'package:chat_app/view/helpers/particle_animation.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/view/common/style/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [electricPurple, backActionColor])),
          ),
        ),
        const Positioned.fill(
          child: Opacity(opacity: 0.5, child: ParticleAnimation(50)),
        ),
        const Center(
          child: CircularProgressIndicator(
            color: backActionColor,
          ),
        )
      ],
    ));
  }
}
