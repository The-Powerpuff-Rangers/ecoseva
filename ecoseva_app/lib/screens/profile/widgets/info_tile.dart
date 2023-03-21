import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoTile extends ConsumerWidget {
  final String label;
  final String value;
  const InfoTile({super.key,required this.label,required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            label,
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w300),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: AutoSizeText(
              value,
              style: textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}
