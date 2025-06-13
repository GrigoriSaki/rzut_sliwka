import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Switch_Button extends StatefulWidget {
  Switch_Button({
    super.key,
    required this.isResistanceEnabled,
    required this.onChanged,
  });

  bool isResistanceEnabled;
  final Function(bool) onChanged;

  @override
  State<Switch_Button> createState() => _Switch_ButtonState();
}

class _Switch_ButtonState extends State<Switch_Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 40,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Opór powietrza ", style: TextStyle(color: Colors.white)),

          Switch(
            value: widget.isResistanceEnabled,
            onChanged: widget.onChanged,
            thumbColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
            activeColor: const Color.fromARGB(255, 226, 74, 252),
          ),
        ],
      ),
    );
  }
}
