import 'package:flutter/material.dart';
import 'package:flutterbookapp/constants/color_constant.dart';
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
      // ignore: missing_required_param
      theme: ThemeData(accentColor: kMainColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      
      ),
      home: HomeScreen(),
      routes: {
        "./homeScreen":(_)=> new HomeScreen()
      },
      
    );
  }
}