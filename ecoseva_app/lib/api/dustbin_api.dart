import 'dart:developer';

import 'package:ecoseva_app/models/dustbin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'client.dart';

final dustbinProvider = Provider<DustbinApi>((ref) {
  final client = ref.watch(clientProvider);
  return DustbinApi(client);
});

final listDustbinsProvider = FutureProvider<List<Dustbin>>((ref) async {
  return ref.watch(dustbinProvider).listDustbins();
});

class DustbinApi {
  final Client client;
  DustbinApi(this.client);

  Future<List<Dustbin>> listDustbins() async {
    try {
      final response = await client.call(RequestType.get, '/list-dustbins', {});
      final listData = List<Map<String, dynamic>>.from(response.data).map((e) => Dustbin.fromMap(e)).toList();
      return listData;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future getDustbinDirection() async {}
}
