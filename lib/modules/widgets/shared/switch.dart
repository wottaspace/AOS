import 'package:flutter/material.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/constants/colors.dart';

class KSwitch extends StatefulWidget {
  final List titles;
  final Function()? onSwitch;
  const KSwitch({Key? key, required this.titles, this.onSwitch})
      : super(key: key);

  @override
  _KSwitchState createState() => _KSwitchState();
}

class _KSwitchState extends State<KSwitch> {
  int selectedId = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: .5, color: KColor.primary),
        color: Colors.white,
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.titles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() => selectedId = widget.titles[index]['id']);
                widget.onSwitch!();
              },
              child: Stack(
                children: [
                  Container(
                    width:
                        (context.customSize.width - 30) / widget.titles.length,
                    decoration: BoxDecoration(
                      color: widget.titles[index]['id'] == selectedId
                          ? KColor.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(index == 0 ? 10 : 0),
                        bottomLeft: Radius.circular(index == 0 ? 10 : 0),
                        bottomRight: Radius.circular(
                            index == widget.titles.length - 1 ? 10 : 0),
                        topRight: Radius.circular(
                            index == widget.titles.length - 1 ? 10 : 0),
                      ),
                    ),
                  ),
                  Container(
                    width:
                        (context.customSize.width - 30) / widget.titles.length,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                            color: index == 0
                                ? Colors.transparent
                                : KColor.primary),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.titles[index]['name'],
                      style: context.textTheme.bodyText1?.copyWith(
                        fontSize: 15,
                        color: widget.titles[index]['id'] == selectedId
                            ? Colors.white
                            : KColor.grey,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
