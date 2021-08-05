import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';

class ShowingStars extends StatelessWidget {
  const ShowingStars({Key? key, required this.stars}) : super(key: key);
  final int stars;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 17,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Icon(
            stars > index ? Icons.star : Icons.star_outline,
            size: 17,
            color: stars > index ? Colors.orange : KColor.grey,
          );
        },
      ),
    );
  }
}
