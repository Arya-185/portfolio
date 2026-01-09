// lib/providers/auth_provider.dart
import 'package:flutter_riverpod/legacy.dart';

// Simple boolean state: true = logged in, false = logged out
class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false); // Default to logged out

  void login() {
    state = true;
  }

  void logout() {
    state = false;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier();
});
