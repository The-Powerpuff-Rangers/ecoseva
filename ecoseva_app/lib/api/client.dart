import 'package:dio/dio.dart';
import 'package:ecoseva_app/models/token.dart';
import 'package:ecoseva_app/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum RequestType { get, post, put, delete }

final clientProvider = Provider<Client>((ref) {
  final Dio dio = Dio();
  const String endpoint = 'http://157.245.98.1:8000';
  final token = ref.watch(authTokenProvider).valueOrNull;
  return Client(endpoint: endpoint, dio: dio, token: token);
});

class Client {
  final String endpoint;
  final Dio dio;
  final AccessToken? token;
  Client({
    required this.endpoint,
    required this.dio,
    this.token,
  }) {
    dio.options.baseUrl = "$endpoint/api";
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = token == null ? null : 'Bearer ${token?.accessToken}';
  }

  Future<Response> call(RequestType type, String path, Map<String, dynamic> data) async {
    switch (type) {
      case RequestType.get:
        return await dio.get('$path/');
      case RequestType.post:
        return await dio.post('$path/', data: data);
      case RequestType.put:
        return await dio.put('$path/');
      case RequestType.delete:
        return await dio.delete('$path/');
    }
  }
}
