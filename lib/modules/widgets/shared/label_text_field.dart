import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField(
      {Key? key,
      required this.label,
      final this.hint,
      this.controller,
      this.maxLines})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String? hint;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.headline6?.copyWith(
                letterSpacing: 2,
                color: KColor.grey,
                fontSize: 11,
                fontWeight: FontWeight.w700)),
        SizedBox(height: 7),
        Card(
          elevation: 2,
          shadowColor: Colors.black54,
          child: TextField(
            maxLines: maxLines ?? 1,
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: hint,
                hintStyle: context.textTheme.headline6
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    );
  }
}
