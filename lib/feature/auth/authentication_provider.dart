import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/enum/cache_items.dart';

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier() : super(const AuthenticationState());
  Future<void> fetchUserDetail(User? user) async {
    //tokeni safe olarak burada saklayacaz
    final token = await user!
        .getIdToken(); //tokeni aldık firebase den . tokeni alıp onu kullanıcıya göndericem onunla işlem yapıcak
    await tokenSaveToCache(token!);
    state = state.copyWith(isRedirect: true);
  }

  Future<void> tokenSaveToCache(String token) async {
    await CacheItem.token.write(token);
  }
}

class AuthenticationState extends Equatable {
  final bool isRedirect;

  const AuthenticationState({this.isRedirect = false});

  @override
  // TODO: implement props
  List<Object?> get props => [isRedirect];

  AuthenticationState copyWith({
    bool? isRedirect,
  }) {
    return AuthenticationState(
      //burada bir state döndürüyoruz

      isRedirect: isRedirect ?? this.isRedirect,
    );
  }
}
