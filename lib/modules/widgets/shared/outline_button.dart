import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class OutlinedButton extends StatelessWidget {
  const OutlinedButton({
    Key? key,
    this.onTap,
    required this.label,
    this.color,
  }) : super(key: key);

  final Function()? onTap;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: color ?? KColor.primary,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.textTheme.bodyText1?.copyWith(
            color: color ?? KColor.primary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
