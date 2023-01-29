import 'package:flutter/material.dart';

import 'package:motion/motion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the plugin to determine gyroscope availability.
  await Motion.instance.initialize();

  /// Globally set Motion's update interval to 60 frames per second.
  Motion.instance.setUpdateInterval(60.fps);

  runApp(const CAI());
}

class CAI extends StatelessWidget {
  const CAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConsciusAI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Motion.elevated(
              elevation: 50,
              child: Center(
                child: Text(
                  'ConsciusAI',
                  style: TextStyle(
                    fontFamily: 'Eurostile',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
