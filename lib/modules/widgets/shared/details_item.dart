import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyText1?.copyWith(
              fontSize: 11,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w700,
              color: KColor.grey),
        ),
        SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(color: KColor.grey.withOpacity(.1)),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyText1?.copyWith(
                fontSize: 10, fontWeight: FontWeight.w800, color: KColor.grey),
          ),
        )
      ],
    );
  }
}
