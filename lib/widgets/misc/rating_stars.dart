import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    Key? key,
    required this.score,
  }) : super(key: key);

  final double score;

  @override
  Widget build(BuildContext context) {
    final int intPart = score.floor();

    int emptyStarsCount = (5 - score).abs().floor();

    return Row(
      children: [
        ...List.generate(
          intPart,
          (index) => Icon(PhosphorIcons.star_fill, color: ColorConstants.yellow, size: 10),
        ),
        Icon(PhosphorIcons.star_half_fill, color: ColorConstants.yellow, size: 10),
        ...List.generate(
          emptyStarsCount,
          (index) => Icon(PhosphorIcons.star, color: ColorConstants.yellow, size: 10),
        )
      ],
    );
  }
}
