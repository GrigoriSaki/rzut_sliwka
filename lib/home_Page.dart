import 'package:flutter/material.dart';
import 'package:rzut_sliwka/MainContainers/settings_container.dart';
import 'package:rzut_sliwka/MainContainers/animation_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _velocity = 75;
  double showVelocity = 15;
  double _angle = 45;
  bool _shouldThrow = false;
  VoidCallback? onThrow;

  void _handleThrowPressed() {
    if (onThrow != null) {
      onThrow!(); // wywołaj funkcję z AnimationWidget
    }
  }

  void _onVelocityChanged(double newVelocity) {
    setState(() {
      _velocity = newVelocity;
      showVelocity = newVelocity / 5;
    });
  }

  void _onAngleChanged(double newAngle) {
    setState(() {
      _angle = newAngle;
    });
  }

  void _onAnimationCompleted() {
    setState(() {
      _shouldThrow = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rzut śliwką",
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 28,
            color: Colors.white,
          ),
        ),

        backgroundColor: const Color.fromARGB(255, 255, 72, 16),
        elevation: 8,
        shadowColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 152, 50, 19),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              AnimationContainer(
                velocity: _velocity,
                activeAngle: _angle,
                shouldThrow: _shouldThrow,
                onCompleted: _onAnimationCompleted,
                onThrowInit: (VoidCallback callback) {
                  onThrow = callback;
                },
              ),
              SizedBox(width: 20),
              SettingsContainer(
                velocity: _velocity,
                showVelocity: showVelocity,
                onVelocityChanged: _onVelocityChanged,
                onThrowPressed: _handleThrowPressed,
                angle: _angle,
                onAngleChanged: _onAngleChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
