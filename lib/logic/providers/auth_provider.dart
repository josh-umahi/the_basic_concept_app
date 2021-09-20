import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = true;

  bool get isAuthenticated => _isAuthenticated;

  /// Chose not to invoke notifyListeners() here so
  /// that the Welcome Screen won't be pushed onto the
  /// screen twice
  void signIn() {
    _isAuthenticated = true;
  }

  /// Chose not to invoke notifyListeners() here so
  /// that the Welcome Screen won't be pushed onto the
  /// screen twice
  void signOut() {
    _isAuthenticated = false;
  }
}
