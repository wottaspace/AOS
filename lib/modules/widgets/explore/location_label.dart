import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class LocationLabel extends StatelessWidget {
  const LocationLabel({
    Key? key,
    this.onTap,
    required this.location,
  }) : super(key: key);

  final Map location;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(location['icon'], size: 15, color: KColor.grey),
              SizedBox(width: 8),
              Text(
                '${location['name']}',
                style: context.textTheme.headline6?.copyWith(
                    color: KColor.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
