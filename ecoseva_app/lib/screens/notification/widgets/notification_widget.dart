import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/colors.dart';
import '../../../gen/assets.gen.dart';

class NotificationWidget extends ConsumerWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 6),
      decoration: const BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.parrotGreen,
            child: Assets.icons.trash.image(),
          ),
          AutoSizeText('Your nearest dustbin is fulll',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                // color: Colors.white,
              )),
          AutoSizeText('1h',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w300,
                // color: Colors.white,
              )),
        ],
      ),
    );
  }
}
