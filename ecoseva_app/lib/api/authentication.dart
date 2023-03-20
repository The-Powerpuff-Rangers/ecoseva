import 'dart:developer';

import 'package:ecoseva_app/models/token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../providers/providers.dart';
import 'client.dart';

final authenticationProvider = Provider<Authentication>((ref) {
  final client = ref.watch(clientProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return Authentication(client, secureStorage);
});

class Authentication {
  final Client client;
  final FlutterSecureStorage storage;
  Authentication(this.client, this.storage);
  Future<AccessToken> login(String email, String password) async {
    try {
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };

      final result = await client.call(RequestType.post, '/login', data);
      final tokens = AccessToken.fromMap(result.data);
      await Future.wait([
        storage.write(key: 'access', value: tokens.accessToken),
        storage.write(key: 'refresh', value: tokens.refreshToken),
      ]);

      return tokens;
    } catch (e) {
      rethrow;
    }
  }

  Future<AccessToken> signUp(String email, String password) async {
    try {
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
        'name': 'Test',
        'dob': '1999-01-01',
      };

      final result = await client.call(RequestType.post, '/register', data);
      return AccessToken.fromMap(result.data);
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future loginWithGoogle() async {
    throw UnimplementedError();
  }

  Future logout() async {
    await Future.wait([
      storage.delete(key: 'access'),
      storage.delete(key: 'refresh'),
    ]);
  }
}
