import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/job/avatar_card.dart';
import 'package:openarc_employer/modules/widgets/job/label_location.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class JobListCard extends StatelessWidget {
  const JobListCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 190,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                RichText(
                    text: TextSpan(
                        text: '${data['price_per_hour']}',
                        style: context.textTheme.headline4?.copyWith(
                          color: KColor.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                      TextSpan(
                          text: '/hr',
                          style: context.textTheme.headline4
                              ?.copyWith(color: KColor.grey, fontSize: 14))
                    ]))
              ],
            ),
            SizedBox(height: 5),
            Text('${data['description']}',
                style: context.textTheme.headline4
                    ?.copyWith(color: KColor.grey, fontSize: 14)),
            Spacer(),
            Container(
              height: 35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data['location'].length,
                  itemBuilder: (context, labelIndex) {
                    return LabelLocation(data: data['location'][labelIndex]);
                  }),
            ),
            Spacer(),
            Container(
              height: 35,
              width: double.infinity,
              child: Row(
                children: [
                  StackAvatar(data: data),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${data['avatar'][0]['name']} + ${data['avatar'].length - 1} members applied',
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.headline1
                          ?.copyWith(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
