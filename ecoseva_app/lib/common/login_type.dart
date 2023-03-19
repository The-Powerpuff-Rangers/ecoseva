import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginType { login, signup }


final loginTypeProvider = StateProvider<LoginType>((ref) {
  return LoginType.login;
});