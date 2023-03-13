import 'package:fingerprint/pages/landing.dart';
import 'package:fingerprint/screens/login.dart';
import 'package:fingerprint/utilities/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'inter',
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          
          contentPadding: const EdgeInsets.all(20),
          prefixIconColor: blue,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: blue, width: 1),
          ),
          // fillColor: grey.withOpacity(0.5),
          // filled: true
        ),
      ),
      home: Loginpage(),
    ),
  );
}
