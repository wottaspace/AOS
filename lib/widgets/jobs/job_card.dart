import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/widgets/misc/k_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.createdAt,
    required this.jobTitle,
    required this.jobType,
    required this.location,
    this.daysLeftCount,
    this.isCompleted = false,
    this.onTap,
  }) : super(key: key);

  final DateTime createdAt;
  final String jobTitle;
  final String jobType;
  final String location;
  final int? daysLeftCount;
  final bool isCompleted;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            offset: Offset(0, 1),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isCompleted)
                  Text(
                    "COMPLETED",
                    style: Okito.theme.textTheme.bodyText2!.copyWith(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.greenColor,
                    ),
                  ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "$jobTitle",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "\$15",
                            style: Okito.theme.textTheme.bodyText2!.copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Okito.theme.primaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: "/hr",
                                style: Okito.theme.textTheme.bodyText2!.copyWith(
                                  color: ColorConstants.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$jobType",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.greyColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    KChip(
                      title: "$location",
                      boldText: true,
                      icon: PhosphorIcons.map_pin,
                      circularCorners: true,
                      hasShadow: false,
                      color: Okito.theme.primaryColor.withOpacity(0.2),
                      textColor: Okito.theme.primaryColor,
                      onTap: () {},
                    ),
                    if (daysLeftCount != null) ...[
                      SizedBox(width: 10),
                      KChip(
                        title: "$daysLeftCount DAYS LEFT",
                        boldText: true,
                        icon: PhosphorIcons.clock_fill,
                        circularCorners: true,
                        hasShadow: false,
                        color: ColorConstants.orangeColor.withOpacity(0.2),
                        textColor: ColorConstants.orangeColor,
                        onTap: () {},
                      ),
                    ]
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          CircleAvatar(maxRadius: 15),
                          Positioned(
                            left: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                              child: CircleAvatar(maxRadius: 15),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                              child: CircleAvatar(maxRadius: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Harry Sahir & 3 members are working",
                          style: Okito.theme.textTheme.bodyText2!.copyWith(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
