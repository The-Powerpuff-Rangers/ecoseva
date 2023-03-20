import 'package:ecoseva_app/api/profile_api.dart';
import 'package:ecoseva_app/models/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/client.dart';

final profileApiProvider = Provider.autoDispose<ProfileProvider>((ref) {
  final client = ref.watch(clientProvider);
  return ProfileProvider(client);
});

final currentUserProvider = FutureProvider.autoDispose<Profile>((ref) async {
  return ref.watch(profileApiProvider).getCurrentUser();
});
