import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';

class RatingItem extends StatefulWidget {
  const RatingItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  _RatingItemState createState() => _RatingItemState();
}

class _RatingItemState extends State<RatingItem> {
  List selectedIndex = [1];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (selectedIndex.contains(widget.index))
          setState(() => selectedIndex.remove(widget.index));
        else
          setState(() => selectedIndex.add(widget.index));
      },
      child: Row(
        children: [
          selectedIndex.contains(widget.index)
              ? Icon(Icons.check_box, color: KColor.primary)
              : Icon(
                  Icons.check_box_outline_blank,
                  color: KColor.grey,
                ),
          SizedBox(width: 10),
          ShowingStars(
            stars: widget.index + 1,
            size: 20,
          )
        ],
      ),
    );
  }
}
