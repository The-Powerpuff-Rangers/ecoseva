import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textControllerProvider = Provider.family.autoDispose<TextEditingController, String>((ref, key) {
  return TextEditingController();
});

class TextFieldWidget extends ConsumerWidget {
  final String label;
  final ImageProvider<Object> icon;
  final TextEditingController controller;
  final ImageProvider<Object>? suffixIcon;
  final VoidCallback? onTap;
  final bool isVisible;
  const TextFieldWidget(
      {super.key,
      required this.label,
      required this.icon,
      required this.controller,
      this.suffixIcon,
      this.onTap,
      this.isVisible = true})
      : assert(suffixIcon != null && onTap != null || suffixIcon == null && onTap == null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ImageIcon(icon),
          const SizedBox(width: 16.0),
          Expanded(
            child: TextFormField(
              controller: controller,
              obscureText: !isVisible,
              validator: (value) => value!.isEmpty ? 'Please enter some text' : null,
              enableIMEPersonalizedLearning: true,
              enableInteractiveSelection: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: label,
                alignLabelWithHint: true,
                suffixIcon: suffixIcon != null
                    ? GestureDetector(
                        onTap: onTap,
                        child: ImageIcon(suffixIcon),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
