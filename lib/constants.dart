
import 'dart:ui';

import 'package:flutter/material.dart';

const kCOLOR_PRIMARY = Color(0xff6c74f2);
const kCOLOR_ACCENT = Color(0xff471924);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your password.',
  labelText: 'Email',
  prefixIcon: Icon(Icons.email, color: kCOLOR_PRIMARY),

  labelStyle: TextStyle(
    color: kCOLOR_ACCENT,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kCOLOR_PRIMARY),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);