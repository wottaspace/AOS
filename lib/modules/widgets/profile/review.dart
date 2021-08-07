import 'package:flutter/material.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class ReviewCards extends StatelessWidget {
  const ReviewCards({
    Key? key,
    required this.index,
    required this.review,
  }) : super(key: key);

  final Map review;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      margin: EdgeInsets.only(bottom: index == 0 ? 25 : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                        AssetHelper.getAsset(name: review['avatar'])))),
          ),
          SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2),
              Text(
                '${review['name']}',
                style: context.textTheme.headline3?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black),
              ),
              ShowingStars(
                stars: review['rate'],
                size: 20,
              ),
              SizedBox(height: 8),
              Text(
                '${review['text']}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: context.textTheme.headline3?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Colors.black),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
