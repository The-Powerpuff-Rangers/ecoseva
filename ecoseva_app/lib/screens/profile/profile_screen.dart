import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecoseva_app/api/authentication.dart';
import 'package:ecoseva_app/gen/assets.gen.dart';
import 'package:ecoseva_app/providers/auth_providers.dart';
import 'package:ecoseva_app/providers/profile_providers.dart';
import 'package:ecoseva_app/routes/route.dart';
import 'package:ecoseva_app/screens/profile/widgets/info_tile.dart';
import 'package:ecoseva_app/screens/profile/widgets/profile_button.dart';
import 'package:ecoseva_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/colors.dart';

class ProfileScreen extends ConsumerWidget {
  static const routename = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final profile = ref.watch(currentUserProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Profile',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          profile.when(
            data: (data) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.parrotGreen),
                        ),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundColor: AppColors.parrotGreen.withOpacity(0.3),
                          backgroundImage: Assets.images.maleAvatar.provider(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      AutoSizeText(
                        data.name,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  InfoTile(
                    label: 'Date of Birth',
                    value: data.dateOfBirth,
                  ),
                  InfoTile(
                    label: 'Phone Number',
                    value: '+91${data.phone}',
                  ),
                  InfoTile(
                    label: 'Email',
                    value: data.email,
                  ),
                  ProfileButton(
                    onTap: () async {
                      try {
                        await ref.read(authenticationProvider).logout();
                        ref.invalidate(authTokenProvider);
                        ref.read(routeProvider).go(SplashScreen.routename);
                      } on Exception catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                          ),
                        );
                      }
                    },
                    isDestructive: true,
                    label: 'Logout',
                  )
                ],
              );
            },
            loading: () => const Expanded(child: Center(child: CircularProgressIndicator.adaptive())),
            error: (error, stackTrace) => Text(error.toString()),
          ),
        ],
      ),
    );
  }
}
