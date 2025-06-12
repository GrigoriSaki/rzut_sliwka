import 'package:flutter/material.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Obliczenia",
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 255, 72, 16),
        elevation: 8,
        shadowColor: Colors.black,
      ),
      body: Container(
        color: const Color.fromARGB(255, 152, 50, 19),
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Przypadek 1",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 600,
                    height: 600,
                    color: Colors.blue,
                    child: Image.asset(
                      'assets/przyp_1.png',
                      scale: 1,

                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    "Przypadek 2",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 600,
                    height: 600,
                    color: Colors.blue,
                    child: Image.asset(
                      'assets/przyp_2.png',
                      scale: 1,

                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
