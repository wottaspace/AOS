import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class HighRatedExploreCard extends StatelessWidget {
  const HighRatedExploreCard({
    Key? key,
    required this.card,
  }) : super(key: key);

  final Map card;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 310,
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      decoration: BoxDecoration(
          color: card['color'], borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      AssetHelper.getAsset(name: card['avatar']),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    '${card['name']}',
                    style: context.textTheme.bodyText1?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  ShowingStars(stars: card['ratings'])
                ],
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.pin_drop_outlined, size: 15, color: Colors.white),
              SizedBox(width: 10),
              Text(card['location'],
                  style: context.textTheme.bodyText1?.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w300,
                  )),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => KRouter().push(KRoutes.userProfileRoute),
              child: Container(
                width: 133,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white12,
                ),
                child: Text('VIEW PROFILE',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
