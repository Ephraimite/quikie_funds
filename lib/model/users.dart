
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UsersModel{

  String? firstName;
  String? lastName;
  String? email;
  int? phone;

  UsersModel({this.firstName, this.lastName, this.email, this.phone});
}