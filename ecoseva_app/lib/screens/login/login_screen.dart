import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecoseva_app/api/authentication.dart';
import 'package:ecoseva_app/providers/auth_providers.dart';
import 'package:ecoseva_app/screens/login/signup_screen.dart';
import 'package:ecoseva_app/screens/login/widgets/signin_button.dart';
import 'package:ecoseva_app/screens/login/widgets/text_field_widget.dart';
import 'package:ecoseva_app/screens/splash/splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/colors.dart';
import '../../common/login_type.dart';
import '../../gen/assets.gen.dart';

final isVisibleProvider = StateProvider<bool>((ref) {
  return false;
});

/// GlobalKey for the form. Need not to be accessed anywhere else!
final _formKeyProvider = Provider.autoDispose<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

class LoginScreen extends ConsumerWidget {
  static const String routename = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final emailController = ref.watch(textControllerProvider('email'));
    final passwordController = ref.watch(textControllerProvider('password'));
    final formKey = ref.watch(_formKeyProvider);
    final authData = ref.watch(authenticationProvider);
    return Scaffold(body: LayoutBuilder(builder: (context, size) {
      return KeyboardDismissOnTap(
        dismissOnCapturedTaps: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 24.0, right: 24.0),
            child: Form(
              key: formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Center(
                  child: Assets.images.login.image(
                    scale: 1.6,
                  ),
                ),
                Hero(
                  tag: 'login',
                  child: AutoSizeText(
                    'Login',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextFieldWidget(
                  controller: emailController,
                  label: 'Email',
                  icon: Assets.icons.mail.provider(),
                ),
                TextFieldWidget(
                  isVisible: ref.watch(isVisibleProvider),
                  controller: passwordController,
                  label: 'Password',
                  icon: Assets.icons.lock.provider(),
                  suffixIcon: ref.watch(isVisibleProvider)
                      ? Assets.icons.visible2.provider()
                      : Assets.icons.visible1.provider(),
                  onTap: () {
                    ref.watch(isVisibleProvider.notifier).update((state) => !state);
                  },
                ),
                SignInButton(
                  label: 'Login',
                  onTap: () async {
                    // If the data does not exist. we will spawn a create a new user app.
                    // But before that spawn the permission screen app.
                    // If the permission exists, then no need to show them.
                    final route = GoRouter.of(context);
                    try {
                      if (formKey.currentState!.validate()) {
                         await authData.login(emailController.text, passwordController.text);

                        ref.invalidate(authTokenProvider);

                        route.go(SplashScreen.routename);
                      }
                    } on Exception catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error registering: $e')));
                    }
                  },
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
                    child: SizedBox(
                      width: size.maxWidth * 0.75,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                        Expanded(
                            child: Divider(
                          endIndent: 15,
                        )),
                        AutoSizeText('OR'),
                        Expanded(
                            child: Divider(
                          indent: 15,
                        )),
                      ]),
                    ),
                  ),
                ),
                SignInButton(
                  label: 'Sign in with google',
                  onTap: () {},
                  icon: Assets.icons.google.provider(),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Hero(
                    tag: 'signup',
                    child: AutoSizeText.rich(
                      TextSpan(
                        text: 'New User? ',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.purple,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ref.read(loginTypeProvider.notifier).update((state) => LoginType.signup);
                                context.go(SignupScreen.routename);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
    }));
  }
}
