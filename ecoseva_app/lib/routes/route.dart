
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../common/login_type.dart';
import '../main.dart';
import '../screens/home/home_page.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/login/signup_screen.dart';
import '../screens/notification/notification_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/splash/splash_screen.dart';

final routeProvider = Provider<GoRouter>((ref) {
  final authChecker = ref.watch(authProvider);
  final loginState = ref.watch(loginTypeProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // If our async state is loading, don't perform redirects, yet
      if (authChecker.isLoading || authChecker.hasError) return null;

      final isAuth = authChecker.value!;

      final isSplash = state.location == SplashScreen.routename;
      if (isSplash) {
        return isAuth
            ? HomeScreen.routename
            : loginState == LoginType.login
                ? LoginScreen.routename
                : SignupScreen.routename;
      }

      final isLoggingIn = state.location == LoginScreen.routename || state.location == SignupScreen.routename;
      if (isLoggingIn) return isAuth ? HomeScreen.routename : null;

      return isAuth ? null : SplashScreen.routename;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: LoginScreen.routename,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 400),
          child: const LoginScreen(),
          transitionsBuilder: ((context, animation, secondaryAnimation, child) => FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              )),
        ),
      ),
      GoRoute(
        path: SignupScreen.routename,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 400),
          child: const SignupScreen(),
          transitionsBuilder: ((context, animation, secondaryAnimation, child) => FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              )),
        ),
      ),
      ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return HomePage(child: child);
          },
          routes: [
            GoRoute(
              path: HomeScreen.routename,
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: SearchScreen.routename,
              builder: (context, state) => const SearchScreen(),
            ),
            GoRoute(
              path: NotificationScreen.routename,
              builder: (context, state) => const NotificationScreen(),
            ),
            GoRoute(
              path: ProfileScreen.routename,
              builder: (context, state) => const ProfileScreen(),
            ),
          ]),
    ],
  );
});
