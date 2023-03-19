
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../gen/assets.gen.dart';

class TrashButton extends ConsumerWidget {
  final VoidCallback onTap;
  const TrashButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints.tightFor(
          height: 36.0,
          width: 80.0,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Assets.icons.trashWhite.image(scale: 2),
      ),
    );
  }
}
