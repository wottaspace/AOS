import 'package:flutter/material.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;
import 'package:openarc_employer/utils/extensions/build_context.dart';

class CvCard extends StatelessWidget {
  const CvCard({
    Key? key,
    required this.cv,
  }) : super(key: key);

  final Map cv;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        imageIcon.ImageIcon(
          uri: '${cv['icon']}',
        ),
        Text(
          '${cv['name']}',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: context.textTheme.headline3?.copyWith(
              fontWeight: FontWeight.w400, fontSize: 17, color: Colors.black),
        ),
      ],
    );
  }
}
