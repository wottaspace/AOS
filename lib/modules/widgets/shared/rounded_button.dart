import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class KRoundedButton extends StatelessWidget {
  const KRoundedButton(
      {Key? key, this.width, this.color, required this.label, this.onTap})
      : super(key: key);

  final width, color;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: width ?? 150,
        decoration: BoxDecoration(
          color: color ?? KColor.purple,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.textTheme.headline5?.copyWith(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
