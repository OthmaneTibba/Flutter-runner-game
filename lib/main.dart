import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGame(),
    );
  }
}

class MyGame extends StatefulWidget {
  const MyGame({super.key});

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  List<double> parallaxEffect = [
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  void moveBackground() {
    Timer.periodic(Duration(milliseconds: 20), (timer) {
      setState(() {
        parallaxEffect[1] -= 2;
        parallaxEffect[2] -= 3;
        parallaxEffect[3] -= 3.5;
        parallaxEffect[4] -= 4.3;
        parallaxEffect[5] -= 4;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: moveBackground,
              child: Stack(
                children: [
                  Stack(
                    children: List.generate(
                      6,
                      (index) => Positioned.fill(
                        left: parallaxEffect[index],
                        child: Image(
                          fit: BoxFit.contain,
                          repeat: ImageRepeat.repeat,
                          image: AssetImage('lib/images/plx-${index + 1}.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
