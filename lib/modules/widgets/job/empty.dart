import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class EmptyJob extends StatelessWidget {
  const EmptyJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 60),
        imageIcon.ImageIcon(uri: 'architect_design.png'),
        SizedBox(height: 30),
        Text(
          'No Jobs added',
          style: context.textTheme.headline4?.copyWith(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.w800,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 8,
          ),
          child: Text(
            'You haven\'t added any job\'s yet, add jobs to see all the listing of the jobs. You can add job by click on the add button',
            textAlign: TextAlign.center,
            style: context.textTheme.headline4?.copyWith(
              fontSize: 16,
              color: KColor.grey,
            ),
          ),
        )
      ],
    );
  }
}
