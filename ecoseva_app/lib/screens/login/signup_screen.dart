import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecoseva_app/screens/login/create_profile.dart';
import 'package:ecoseva_app/screens/login/widgets/signin_button.dart';
import 'package:ecoseva_app/screens/login/widgets/text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/colors.dart';
import '../../common/login_type.dart';
import '../../gen/assets.gen.dart';
import 'login_screen.dart';

final isVisibleProvider = StateProvider<bool>((ref) {
  return false;
});

/// GlobalKey for the form. Need not to be accessed anywhere else!
final _formKeyProvider = Provider.autoDispose<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

class SignupScreen extends ConsumerWidget {
  static const String routename = '/signup';
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final emailController = ref.watch(textControllerProvider('email'));
    final passwordController = ref.watch(textControllerProvider('password'));
    final confirmPasswordController = ref.watch(textControllerProvider('confirmPassword'));
    final formKey = ref.watch(_formKeyProvider);

    return Scaffold(body: LayoutBuilder(builder: (context, size) {
      return KeyboardDismissOnTap(
        dismissOnCapturedTaps: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 24.0, right: 24.0),
            child: Form(
              key: formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Center(
                  child: Assets.images.signup.image(
                    scale: 1.6,
                  ),
                ),
                Hero(
                  tag: 'signup',
                  child: AutoSizeText(
                    'Sign Up',
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
                TextFieldWidget(
                  controller: confirmPasswordController,
                  label: 'Confirm Password',
                  icon: Assets.icons.lock.provider(),
                ),
                SignInButton(
                  label: 'Continue',
                  onTap: () {
                    if (passwordController.text != confirmPasswordController.text) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Passwords do not match')));
                      return;
                    }

                    final route = GoRouter.of(context);
                    try {
                      if (formKey.currentState!.validate()) {
                        // await authData.signUp(emailController.text, passwordController.text);

                        // ref.invalidate(authTokenProvider);
                        route.push(CreateProfile.routename);
                      }
                    } on Exception catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error registering: $e')));
                    }
                  },
                ),
                const SizedBox(height: 4),
                AutoSizeText.rich(
                  TextSpan(
                    text: 'By signing up, you\'re agreeing to our',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: ' Terms & Conditions',
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.purple,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.purple,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Hero(
                    tag: 'login',
                    child: AutoSizeText.rich(
                      TextSpan(
                        text: 'Already a user? ',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.purple,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ref.read(loginTypeProvider.notifier).update((state) => LoginType.signup);
                                context.go(LoginScreen.routename);
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
