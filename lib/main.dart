import 'package:cosmetic/homescreen.dart';
import 'package:cosmetic/login.dart';
import 'package:cosmetic/profile.dart';
import 'package:cosmetic/register.dart';
import 'package:cosmetic/search.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => Mylogin(),
        'register': (context) => Myregister(),
        'profile': (context) => profile(),
        'homescreen': ((context) => homescreen()),
        'search': (context) => SearchPage()
      }));
}
