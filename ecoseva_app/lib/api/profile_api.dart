import 'dart:developer';

import '../models/profile.dart';
import 'client.dart';

class ProfileProvider {
  final Client client;

  ProfileProvider(this.client);

  Future<Profile> getCurrentUser() async {
    try {
      final result = await client.call(RequestType.get, '/user-data', {});
      final Profile profile = Profile.fromMap(result.data);
      log(profile.toString());
      return profile;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
