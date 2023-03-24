import 'package:flutter/material.dart';

class Auth {
  static const String pattern = "raveena123";
  static getPermission(param) {
    return param == pattern;
  }
}
