import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String text;
  const AppTitle({super.key, this.text = ''});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
