import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchControllerProvider = Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

class SearchBar extends ConsumerWidget {
  final String label;
  final TextEditingController controller;
  const SearchBar({super.key, required this.label,required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: textTheme.bodyLarge,
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
