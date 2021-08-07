import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/modules/widgets/saved/empty_saved.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class SavedMemberComponent extends StatelessWidget {
  const SavedMemberComponent({Key? key, required this.datas}) : super(key: key);

  final List datas;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'SAVED',
            style: context.textTheme.subtitle1?.copyWith(
                fontSize: 13, color: KColor.grey, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: datas.length,
            itemBuilder: (context, index) {
              var data = datas[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 1),
                child: MemberCard(data: data),
              );
            })
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({
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
                    AssetHelper.getAsset(name: "avatar.jpg"),
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
                  ShowingStars(stars: 4)
                ],
              ),
            ),
            imageIcon.ImageIcon(uri: 'favorite.png'),
          ],
        ),
      ),
    );
  }
}
