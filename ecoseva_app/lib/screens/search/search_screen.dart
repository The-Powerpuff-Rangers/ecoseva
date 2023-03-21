import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecoseva_app/api/dustbin_api.dart';
import 'package:ecoseva_app/screens/search/widgets/search_bar.dart';
import 'package:ecoseva_app/screens/search/widgets/search_result.dart';
import 'package:ecoseva_app/screens/search/widgets/trash_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  static const routename = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final dustbins = ref.watch(listDustbinsProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: AutoSizeText(
            'Search',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SearchBar(
          controller: ref.watch(searchControllerProvider),
          label: 'Search Locations',
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              AutoSizeText(
                'Recent Searches',
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              TrashButton(
                onTap: () async {
                  await ref.read(dustbinProvider).listDustbins();
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        dustbins.when(
            data: (data) {
              final List<Widget> widgets = [];
              if (data.isEmpty) {
                return const SizedBox.shrink();
              } else {
                for (var element in data) {
                  widgets.add(SearchResult(dustbin: element));
                }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgets,
              );
              // return data.map((e) => SearchResult(dustbin: e)).toList();
            },
            error: (error, _) => const Text('Error'),
            loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ))
      ],
    );
  }
}
