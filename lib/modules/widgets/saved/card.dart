import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class SavedCard extends StatelessWidget {
  const SavedCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 135,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${data['name']}',
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.headline3?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text('${data['description']}',
                      style: context.textTheme.headline4
                          ?.copyWith(color: KColor.grey, fontSize: 14)),
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
            Container(
              height: 35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data['location'].length,
                  itemBuilder: (context, labelIndex) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(data['location'][labelIndex]["icon"],
                              size: 15,
                              color: data['location'][labelIndex]["color"]),
                          SizedBox(width: 8),
                          Text(
                            '${data['location'][labelIndex]['name']}',
                            style: context.textTheme.headline6?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: data['location'][labelIndex]["color"]),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: data['location'][labelIndex]["color"]
                              .withOpacity(.1),
                          borderRadius: BorderRadius.circular(20)),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
