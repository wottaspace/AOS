import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText({required this.text});

  final String text;
  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> with TickerProviderStateMixin<ExpandableText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: new ConstrainedBox(
            constraints: isExpanded ? const BoxConstraints() : const BoxConstraints(maxHeight: 50.0),
            child: GestureDetector(
              onTap: () => setState(() => isExpanded = false),
              child: Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        isExpanded
            ? SizedBox()
            : GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "show more",
                    style: Okito.theme.textTheme.bodyText2!.copyWith(color: ColorConstants.greyColor),
                  ),
                ),
                onTap: () => setState(() => isExpanded = true),
              )
      ],
    );
  }
}
