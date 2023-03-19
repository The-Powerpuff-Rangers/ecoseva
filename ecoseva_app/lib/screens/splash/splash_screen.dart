import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/assets.gen.dart';

class SplashScreen extends ConsumerWidget {
  static String routename = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AutoSizeText(
              'EcoSewa',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            right: -90,
            child: Assets.images.dustbin.image(
              scale: 2.1,
            ),
          ),
        ],
      ),
    );
  }
}
