import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class TitleBar extends StatelessWidget {
  TitleBar({
    Key? key,
    required this.onBackPressed,
    required this.activeIndex,
  }) : super(key: key);

  final Function onBackPressed;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final actionTextStyle = Okito.theme.textTheme.bodyText2!.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: ColorConstants.greyColor,
    );

    final titleTextStyle = Okito.theme.textTheme.bodyText2!.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: Okito.pop,
              child: Text(
                "Cancel",
                style: actionTextStyle,
              ),
            ),
            Text(
              "Post a job",
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: activeIndex == 5
                  ? null
                  : () {
                      onBackPressed();
                    },
              child: Text(
                "Next",
                style: activeIndex == 5
                    ? actionTextStyle
                    : actionTextStyle.copyWith(
                        color: Okito.theme.primaryColor,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
