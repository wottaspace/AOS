import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/shared/grey_title.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class EmptyDisputeScreen extends StatelessWidget {
  const EmptyDisputeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          GreyTitleScreen(label: 'open'),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              'No disputes to show',
              style: context.textTheme.bodyText1?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: KColor.grey,
              ),
            ),
          ),
          SizedBox(height: 20),
          GreyTitleScreen(label: 'closed'),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              'No disputes to show',
              style: context.textTheme.bodyText1?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: KColor.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
