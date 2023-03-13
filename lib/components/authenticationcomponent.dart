import 'dart:async';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> hasBiometric() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometric();

    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
          localizedReason: 'Please authenticate to contiune!',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } on PlatformException {
      return false;
    }
  }
}
