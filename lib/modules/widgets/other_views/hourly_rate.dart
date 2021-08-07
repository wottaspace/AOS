import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class HourlyItem extends StatefulWidget {
  const HourlyItem({
    Key? key,
    required this.hourlyRate,
  }) : super(key: key);

  final Map hourlyRate;

  @override
  _HourlyItemState createState() => _HourlyItemState();
}

class _HourlyItemState extends State<HourlyItem> {
  List selectedIndex = [3, 4];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (selectedIndex.contains(widget.hourlyRate['id']))
          setState(() => selectedIndex.remove(widget.hourlyRate['id']));
        else
          setState(() => selectedIndex.add(widget.hourlyRate['id']));
      },
      child: Row(
        children: [
          selectedIndex.contains(widget.hourlyRate['id'])
              ? Icon(Icons.check_box, color: KColor.primary)
              : Icon(
                  Icons.check_box_outline_blank,
                  color: KColor.grey,
                ),
          SizedBox(width: 10),
          Text('${widget.hourlyRate['name']}',
              style: context.textTheme.headline1?.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black)),
        ],
      ),
    );
  }
}
