import 'package:ecoseva_app/screens/login/create_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // If our async state is loading, don't perform redirects, yet
      if (authChecker.isLoading || authChecker.hasError) return null;

      final isAuth = authChecker.value!;

      final isSplash = state.location == SplashScreen.routename;
      if (isSplash) {
        return isAuth ? HomeScreen.routename : LoginScreen.routename;
      }

      final isLoggingIn = state.location == LoginScreen.routename ||
          state.location == SignupScreen.routename ||
          state.location == CreateProfile.routename;
      if (isLoggingIn) return isAuth ? HomeScreen.routename : state.subloc;

      return isAuth ? null : SplashScreen.routename;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/form-screen',
        builder: (context, state) => const CreateProfile(),
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
          pageBuilder: (context, state,child) => CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: const Duration(milliseconds: 400),
                child:  HomePage(child: child),
                transitionsBuilder: ((context, animation, secondaryAnimation, child) => FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCubic).animate(animation),
                      child: child,
                    )),
              ),
          routes: [
            GoRoute(
              path: HomeScreen.routename,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: const Duration(milliseconds: 400),
                child: const HomeScreen(),
                transitionsBuilder: ((context, animation, secondaryAnimation, child) => FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCubic).animate(animation),
                      child: child,
                    )),
              ),
            ),
            GoRoute(
              path: SearchScreen.routename,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: const Duration(milliseconds: 400),
                child: const SearchScreen(),
                transitionsBuilder: ((context, animation, secondaryAnimation, child) => FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCubic).animate(animation),
                      child: child,
                    )),
              ),
            ),
            GoRoute(
              path: NotificationScreen.routename,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: const Duration(milliseconds: 400),
                child: const NotificationScreen(),
                transitionsBuilder: ((context, animation, secondaryAnimation, child) => FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCubic).animate(animation),
                      child: child,
                    )),
              ),
            ),
            GoRoute(
              path: ProfileScreen.routename,
              pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: const Duration(milliseconds: 400),
                child: const ProfileScreen(),
                transitionsBuilder: ((context, animation, secondaryAnimation, child) => FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCubic).animate(animation),
                      child: child,
                    )),
              ),
            ),
          ]),
    ],
  );
});
