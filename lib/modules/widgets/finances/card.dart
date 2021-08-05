import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class FinanceCard extends StatelessWidget {
  const FinanceCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 140,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${data['type']}',
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.headline3?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: KColor.grey),
                  ),
                ),
                Text(
                  '${data['date']}',
                  style: context.textTheme.headline4?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: KColor.grey),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${data['name']}',
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.headline3?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                Text(
                  '${data['price']}',
                  style: context.textTheme.headline4?.copyWith(
                    color: KColor.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                AssetHelper.getAsset(name: data['avatar']))))),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data['description']}',
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.headline3?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(height: 3),
                      ShowingStars(stars: data['stars']),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '${data['details']}',
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.headline3?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: KColor.primary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
