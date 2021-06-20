import 'package:flutter/material.dart';
import 'package:flutterbookapp/widget/selected_screen.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectedBookScreen(),
      
    );
  }
}