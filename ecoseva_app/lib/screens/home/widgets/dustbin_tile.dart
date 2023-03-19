import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DustbinTile extends ConsumerWidget {
  const DustbinTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Row(
        children: [
          AutoSizeText(
            'Dustbin',
            style: textTheme.bodyLarge,
          ),
          const Spacer(),
          AutoSizeText(
            '63%',
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
