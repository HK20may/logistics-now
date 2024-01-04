import 'package:flutter/material.dart';
import 'package:logistics_now/presentation/widgets/truck_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(4, 4, 104, 1),
                    Color.fromRGBO(20, 16, 170, 1),
                    Color.fromRGBO(4, 2, 104, 1),
                  ]),
            ),
            child: const TruckAnimation()));
  }
}
