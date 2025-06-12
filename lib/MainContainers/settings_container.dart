import 'package:flutter/material.dart';
import 'package:rzut_sliwka/calc_page.dart' show CalculationPage;

class SettingsContainer extends StatefulWidget {
  SettingsContainer({
    super.key,
    required this.velocity,
    required this.showVelocity,
    required this.angle,
    required this.onVelocityChanged,
    required this.onAngleChanged,
    required this.onThrowPressed,
  });
  final double angle;
  final double velocity;
  final double showVelocity;
  final ValueChanged<double> onAngleChanged;
  final ValueChanged<double> onVelocityChanged;

  final VoidCallback onThrowPressed;

  @override
  State<SettingsContainer> createState() => _SettingsContainerState();
}

class _SettingsContainerState extends State<SettingsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 9, 66, 95),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 650,
      width: 285,
      child: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Siła rzutu",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  widget.showVelocity.toStringAsFixed(0) + ' km/h',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Slider(
            min: 50,
            max: 150,
            divisions: 20,

            value: widget.velocity,

            activeColor: Colors.deepOrange,
            onChanged: widget.onVelocityChanged,
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kąt rzutu",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  widget.angle.toStringAsFixed(0) + "°",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Slider(
            min: 30,
            max: 90,
            divisions: 4,
            value: widget.angle,

            activeColor: Colors.deepOrange,
            onChanged: widget.onAngleChanged,
          ),
          SizedBox(height: 15),
          Text(
            "Odległość obiektów (L):  3,15m",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: widget.onThrowPressed,

            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(200, 50)),
              backgroundColor: WidgetStatePropertyAll(
                const Color.fromARGB(255, 0, 129, 234),
              ),
            ),
            child: Text(
              "Rzuć",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),

          Expanded(child: SizedBox()),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalculationPage()),
              );
            },
            child: Text(
              "Podgląd obliczeń >>",
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
