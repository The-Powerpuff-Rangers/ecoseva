import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String label;
  final TextInputType type;
  final int? maxLines;
  final TextEditingController controller;
  final bool trailingIcon;
  const FormWidget({
    Key? key,
    this.maxLines,
    required this.label,
    this.trailingIcon = false,
    required this.controller,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            label,
            style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 6),
          TextFormField(
            autocorrect: true,
            controller: controller,
            enableIMEPersonalizedLearning: true,
            enableSuggestions: true,
            keyboardType: type,
            maxLines: maxLines,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
