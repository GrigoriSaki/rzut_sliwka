import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:rzut_sliwka/components/switch_button.dart';

// ignore: must_be_immutable
class AnimationContainer extends StatefulWidget {
  AnimationContainer({
    super.key,
    required this.velocity,
    required this.activeAngle,
    required this.shouldThrow,
    required this.onCompleted,
    required this.onThrowInit,
  });
  final double velocity;
  final double activeAngle;
  final bool shouldThrow;
  final VoidCallback onCompleted;
  final Function(VoidCallback) onThrowInit;
  bool isResistanceEnabled = false;

  @override
  State<AnimationContainer> createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  double _x = 50;
  double _y = 50;
  Timer? _timer;
  double _currentTime = 0;
  double _currentSpeed = 0;
  double _distanceFromStart = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.onThrowInit(_startThrow);
  }

  void _startThrow() {
    setState(() {
      _x = 50;
      _y = 50;
    });
    double t = 0;
    const dt = 0.05;
    double angle = widget.activeAngle * pi / 180;
    const g = 9.81;
    double vx = widget.velocity * cos(angle);
    double vy = widget.velocity * sin(angle);

    _timer?.cancel();

    _timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      setState(() {
        t += dt;
        _currentTime = t / 18.25;

        final speed = sqrt(vx * vx + vy * vy);
        _currentSpeed = speed / 17.76;
        if (speed > 0) {
          vx -= 0.25 * (vx / speed) * dt;
          vy -= 0.25 * (vy / speed) * dt;
        }

        vy -= g * dt;

        if (widget.isResistanceEnabled) {
          _x += vx * dt;
          _y += vy * dt;
        } else {
          _x = (widget.velocity * cos(angle) * t) + 50;
          _y = (widget.velocity * sin(angle) * t - 0.5 * g * t * t) + 50;
        }

        if (_y <= 40) {
          _y = 50;
          timer.cancel();
        }
        _distanceFromStart = (_x - 50) * 0.003054;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: 1200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xff071E2B),

            Color.fromARGB(255, 9, 37, 53),
            Color.fromARGB(255, 8, 49, 70),
            Color.fromARGB(255, 15, 87, 124),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 40,

            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Container(width: 1170, height: 12, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: _y,
            left: _x,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.purpleAccent, width: 8),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            right: 0,
            child: Container(
              color: Colors.transparent,
              height: 300,
              width: 120,
              child: Image.asset(
                'assets/trash.png',
                scale: 1,
                width: 150,
                height: 280,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Switch_Button(
                  isResistanceEnabled: widget.isResistanceEnabled,
                  onChanged: (value) {
                    setState(() {
                      widget.isResistanceEnabled = value;
                    });
                  },
                ),
                SizedBox(height: 10),

                Text(
                  "⏱️ Czas: ${_currentTime.toStringAsFixed(2)} s",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),

                Text(
                  "🚀 Prędkość: ${_currentSpeed.toStringAsFixed(2)} m/s",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  "📍 Dystans: ${_distanceFromStart.toStringAsFixed(2)} m",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
          Positioned(
            right: 75,

            child: Column(
              children: [
                Container(width: 2, height: 180, color: Colors.lightBlueAccent),
                Text("3,15m", style: TextStyle(color: Colors.white)),
                Container(width: 2, height: 450, color: Colors.lightBlueAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
