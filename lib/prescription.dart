import 'package:flutter/material.dart';

class Prescription extends StatelessWidget {
  const Prescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Prescription"),
        centerTitle: true,
      ),
      body: Image.asset(
        'image/PRE.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
