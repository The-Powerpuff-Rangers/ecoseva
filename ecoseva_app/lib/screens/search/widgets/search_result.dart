import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecoseva_app/models/dustbin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResult extends ConsumerWidget {
  final Dustbin dustbin;
  const SearchResult({super.key, required this.dustbin});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AutoSizeText(
        dustbin.location,
        style: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
