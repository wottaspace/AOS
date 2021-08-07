import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class GreyTitleScreen extends StatelessWidget {
  const GreyTitleScreen({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label.toUpperCase(),
        overflow: TextOverflow.ellipsis,
        style: context.textTheme.headline6?.copyWith(
            color: KColor.grey, fontSize: 11, fontWeight: FontWeight.w700));
  }
}
