
import 'package:ecoseva_app/providers/auth_providers.dart';
import 'package:ecoseva_app/providers/providers.dart';
import 'package:ecoseva_app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'common/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const secureStorage = FlutterSecureStorage();

  // Get the shared preferences instance before launching the app
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      secureStorageProvider.overrideWithValue(secureStorage),
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
  );

  /// Throws a weird error, not sure why its happening
  /// FIX: https://stackoverflow.com/questions/73591769/got-a-stack-frame-from-packagestack-trace-where-a-vm-or-web-frame-was-expected
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.watch(routeProvider);
    return MaterialApp.router(
      title: 'Eco Sewa',
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
      theme: EcoSewaTheme.lightTheme,
    );
  }
}

final authProvider = FutureProvider<bool>((ref) async {
  return await ref.watch(authTokenProvider.future).then((value) => value != null);
});
