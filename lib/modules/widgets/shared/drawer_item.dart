import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class KDrawerItem extends StatelessWidget {
  const KDrawerItem({
    Key? key,
    required this.icon,
    this.onTap,
    required this.label,
  }) : super(key: key);

  final Function()? onTap;
  final String label, icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        KRouter().pop();
        onTap!();
      },
      child: Column(
        children: [
          Row(
            children: [
              imageIcon.ImageIcon(uri: icon),
              SizedBox(width: 15),
              Text(label,
                  style: context.textTheme.bodyText1
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w400))
            ],
          ),
          SizedBox(height: 10),
          Divider()
        ],
      ),
    );
  }
}
