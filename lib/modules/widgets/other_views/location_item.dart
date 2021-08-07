import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class LocationItem extends StatefulWidget {
  const LocationItem({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Map location;

  @override
  _LocationItemState createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  List selectedIndex = [3, 7];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (selectedIndex.contains(widget.location['id']))
          setState(() => selectedIndex.remove(widget.location['id']));
        else
          setState(() => selectedIndex.add(widget.location['id']));
      },
      child: Row(
        children: [
          selectedIndex.contains(widget.location['id'])
              ? Icon(Icons.check_box, color: KColor.primary)
              : Icon(
                  Icons.check_box_outline_blank,
                  color: KColor.grey,
                ),
          SizedBox(width: 10),
          Text('${widget.location['name']}',
              style: context.textTheme.headline1?.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black)),
        ],
      ),
    );
  }
}
