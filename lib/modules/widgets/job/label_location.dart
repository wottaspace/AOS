import 'package:flutter/material.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class LabelLocation extends StatelessWidget {
  const LabelLocation({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(data["icon"], size: 15, color: data["color"]),
          SizedBox(width: 8),
          Text(
            '${data['name']}',
            style: context.textTheme.headline6?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: data["color"]),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: data["color"].withOpacity(.1),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
