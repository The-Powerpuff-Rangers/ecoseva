import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/colors.dart';

class SignInButton extends ConsumerWidget {
  final String label;
  final ImageProvider<Object>? icon;
  final VoidCallback onTap;
  const SignInButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, size) {
      if (icon == null) {
        return Center(
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: size.maxWidth,
              margin: const EdgeInsets.symmetric(vertical: 18.0),
              alignment: Alignment.center,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: theme.primaryColor,
              ),
              child: AutoSizeText(
                label,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
        );
      } else {
        return Center(
          child: GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: size.maxWidth,
              margin: const EdgeInsets.symmetric(vertical: 18.0),
              alignment: Alignment.center,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppColors.lightamber,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: icon as ImageProvider),
                  const SizedBox(width: 12.0),
                  AutoSizeText(
                    label,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
