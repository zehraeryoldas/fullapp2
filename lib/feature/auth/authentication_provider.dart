import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier() : super(AuthenticationState());
  void fetchUserDetail(User user) {
    final token = user.getIdToken();
  }
}

class AuthenticationState {}
