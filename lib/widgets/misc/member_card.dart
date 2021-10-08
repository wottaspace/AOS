import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/widgets/misc/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.username,
    required this.score,
    required this.onTap,
    this.hidePayRate = false,
    this.hideLikeButton = false,
  }) : super(key: key);

  final String username;
  final double score;
  final Function onTap;
  final bool hidePayRate;
  final bool hideLikeButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 2.0,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$username",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        const RatingStars(score: 1.2),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (!hidePayRate) ...[
                      RichText(
                        text: TextSpan(
                          text: "\$15",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                            color: Okito.theme.primaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: "/hr",
                              style: Okito.theme.textTheme.bodyText2!.copyWith(
                                color: ColorConstants.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                    if (!hideLikeButton)
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorConstants.greyColor),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            PhosphorIcons.heart,
                            size: 12,
                            color: ColorConstants.greyColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
