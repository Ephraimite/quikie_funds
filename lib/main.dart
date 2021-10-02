import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quikie_funds/screens/home.dart';
import 'package:quikie_funds/screens/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
  ));
}

