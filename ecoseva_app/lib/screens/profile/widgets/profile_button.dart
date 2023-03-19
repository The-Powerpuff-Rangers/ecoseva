import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/colors.dart';

class ProfileButton extends ConsumerWidget {
  final VoidCallback onTap;
  final bool isDestructive;
  final String label;
  const ProfileButton({super.key, required this.onTap, this.isDestructive = false, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints.tightFor(width: 100, height: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isDestructive ? AppColors.red : AppColors.darkGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: AutoSizeText(
            label,
            style: textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
