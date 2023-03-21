import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecoseva_app/api/authentication.dart';
import 'package:ecoseva_app/providers/auth_providers.dart';
import 'package:ecoseva_app/routes/route.dart';
import 'package:ecoseva_app/screens/login/widgets/form_widget.dart';
import 'package:ecoseva_app/screens/login/widgets/text_field_widget.dart';
import 'package:ecoseva_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/colors.dart';

final mobileNumberControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

final dateofBirthControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

final nameControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

class CreateProfile extends ConsumerWidget {
  static const routename = '/form-screen';

  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobileNumber = ref.watch(mobileNumberControllerProvider);
    final dateofBirth = ref.watch(dateofBirthControllerProvider);
    final name = ref.watch(nameControllerProvider);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: LayoutBuilder(builder: (context, size) {
        return KeyboardDismissOnTap(
          dismissOnCapturedTaps: true,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText('Complete your profile',
                          style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w500)),
                      AutoSizeText(
                        'Just one more step to complete the registration.',
                        style: textTheme.bodyLarge?.copyWith(color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: 30),
                      FormWidget(
                        label: 'Name',
                        controller: name,
                      ),
                      FormWidget(label: 'Phone number', controller: mobileNumber, type: TextInputType.number),
                      FormWidget(
                        label: 'Date of Birth',
                        controller: dateofBirth,
                        type: TextInputType.text,
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: MaterialButton(
                          onPressed: () async {
                            final data = {
                              'name': name.text,
                              'phone': mobileNumber.text,
                              'dob': dateofBirth.text,
                              'email': ref.read(textControllerProvider.call('email')).text,
                              'password': ref.read(textControllerProvider.call('password')).text,
                            };
                            log(data.toString());

                            await ref.read(authenticationProvider).signUp(data);
                            ref.invalidate(authTokenProvider);
                            ref.read(routeProvider).go(SplashScreen.routename);
                          },
                          textColor: Colors.white,
                          textTheme: ButtonTextTheme.primary,
                          minWidth: size.maxWidth / 2,
                          padding: const EdgeInsets.all(18),
                          color: AppColors.parrotGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: AppColors.parrotGreen),
                          ),
                          child: const Text(
                            'Create Profile',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
