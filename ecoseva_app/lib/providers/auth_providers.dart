import 'package:flutter_riverpod/flutter_riverpod.dart';

final authTokenProvider = FutureProvider<String?>((ref) async {
  // final storage = ref.watch(secureStorageProvider);
  // return storage.read(key: 'token');
  return Future.delayed(const Duration(seconds: 2));
});
