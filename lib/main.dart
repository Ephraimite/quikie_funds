import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikie_funds/screens/home.dart';
import 'package:quikie_funds/screens/splash.dart';
import 'package:quikie_funds/states/auth_state.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthenticationProvider(),),

      ],
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeData(
          primaryColor: kCOLOR_PRIMARY,
        ),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

