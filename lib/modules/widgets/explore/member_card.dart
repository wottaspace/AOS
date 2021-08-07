import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class ExploreMemberCard extends StatelessWidget {
  const ExploreMemberCard({Key? key, required this.data, this.onTap})
      : super(key: key);

  final Map data;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 100,
          padding: EdgeInsets.only(left: 15, right: 25),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AssetHelper.getAsset(name: data['avatar']),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data['name']}',
                      style: context.textTheme.headline5?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    ShowingStars(stars: data['ratings'])
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: '${data['price']}',
                          style: context.textTheme.headline5?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: KColor.primary,
                          ),
                          children: [
                        TextSpan(
                          text: '/hr',
                          style: context.textTheme.headline5?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: KColor.grey,
                          ),
                        )
                      ])),
                  SizedBox(height: 5),
                  data['favorite']
                      ? imageIcon.ImageIcon(
                          uri: 'favorite_colored.png',
                        )
                      : imageIcon.ImageIcon(uri: 'favorite.png')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
