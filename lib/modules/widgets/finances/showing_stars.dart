import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';

class ShowingStars extends StatelessWidget {
  const ShowingStars({Key? key, required this.stars, this.color, this.size})
      : super(key: key);
  final int stars;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107,
      height: 18,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Icon(
            stars > index ? Icons.star : Icons.star_outline,
            size: size ?? 17,
            color: stars > index
                ? color ?? Colors.orange
                : (color == null ? KColor.grey : Colors.black26),
          );
        },
      ),
    );
  }
}
