import 'package:conversor_moedas/presentation/screens/screen_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ScreenHome(),
    theme: ThemeData(
      hintColor: Colors.amber,
      primaryColor: Colors.white,
    ),
  ));
}
