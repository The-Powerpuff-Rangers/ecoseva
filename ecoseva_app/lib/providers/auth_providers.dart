import 'package:ecoseva_app/models/token.dart';
import 'package:ecoseva_app/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authTokenProvider = FutureProvider<AccessToken?>((ref) async {
  final storage = ref.watch(secureStorageProvider);
  final accesstoken = await storage.read(key: 'access');
  final refreshToken = await storage.read(key: 'refresh');

  if (accesstoken != null && refreshToken != null) {
    return AccessToken(accessToken: accesstoken, refreshToken: refreshToken);
  }
  return null;
});
