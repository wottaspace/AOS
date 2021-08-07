import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/saved/card.dart';
import 'package:openarc_employer/modules/widgets/saved/empty_draft.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class DraftComponent extends StatelessWidget {
  const DraftComponent({Key? key, required this.datas}) : super(key: key);

  final List datas;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'DRAFTS',
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
                child: SavedCard(data: data),
              );
            })
      ],
    );
  }
}
