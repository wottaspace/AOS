import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class InboxCards extends StatelessWidget {
  const InboxCards({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: '${data['description']}',
                        style: context.textTheme.headline5?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: '  |  ',
                            style: context.textTheme.headline5?.copyWith(
                                fontSize: 12,
                                color: KColor.primary.withOpacity(.08)),
                          ),
                          TextSpan(text: '${data['name']}')
                        ]),
                  ),
                  SizedBox(height: 9),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${data['message']}',
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.headline5?.copyWith(
                            fontSize: 14,
                            color: KColor.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${data['date']}',
                        style: context.textTheme.headline5?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
