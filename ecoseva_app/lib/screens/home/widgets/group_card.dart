import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/colors.dart';
import 'dustbin_tile.dart';

class GroupCard extends ConsumerWidget {
  const GroupCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        decoration: BoxDecoration(color: AppColors.lightGrey),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.parrotGreen,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: AutoSizeText(
                'Group A',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const DustbinTile(),
            const DustbinTile(),
            const DustbinTile(),
          ],
        ),
      ),
    );
  }
}
