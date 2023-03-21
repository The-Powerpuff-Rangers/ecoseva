import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/colors.dart';
import '../../../gen/assets.gen.dart';

class InfoCard extends ConsumerWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return LayoutBuilder(builder: (context, size) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
            color: AppColors.lightviolet,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Assets.icons.bulb.image(),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Did you Know ?',
                    style: textTheme.bodyLarge,
                  ),
                  AutoSizeText(
                    'As of 2021, the world generated over 2.01 billion tons of municipal solid waste annually',
                    wrapWords: true,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
