import 'package:flutter/material.dart';

import 'package:motion/motion.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const caiTextList = [
  'Conscius AI', // Latin
  'जागरूक एआई', // Hindi
  'IA consciente', // French
  'Bewusste KI', // German
  'Сознательный ИИ', // Russian
  '有意识的人工智能', // Chinese
  'Συνειδητή AI', // Greek
  '意識的な AI', // Japanese
  'AI מודע', //  Hebrew
  '의식 있는 AI', // Korean
];

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
    return const MaterialApp(
      title: 'ConsciusAI',
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('https://github.com/Conscious-AI/conscious-ai.github.io/raw/main/assets/videos/lights.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller
            ..setLooping(true)
            ..play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Motion.elevated(
          elevation: 150,
          glare: false,
          child: Stack(
            children: [
              _controller.value.isInitialized
                  ? SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    )
                  : Container(),
              Center(
                child: AnimatedTextKit(
                  repeatForever: true,
                  totalRepeatCount: caiTextList.length,
                  animatedTexts: [
                    for (int i = 0; i < caiTextList.length; i++)
                      FlickerAnimatedText(
                        caiTextList[i],
                        textStyle: const TextStyle(
                          fontFamily: 'Eurostile',
                          fontSize: 72,
                          color: Colors.white,
                        ),
                        speed: const Duration(seconds: 3),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
