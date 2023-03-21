import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DustbinTile extends ConsumerWidget {
  final String title;
  final String percentage;
  const DustbinTile({super.key, required this.title, required this.percentage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Row(
        children: [
          AutoSizeText(
            title,
            style: textTheme.bodyLarge,
          ),
          const Spacer(),
          AutoSizeText(
            percentage,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
