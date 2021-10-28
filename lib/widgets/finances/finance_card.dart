import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/core/models/finance.dart';
import 'package:arcopen_enquirer/widgets/misc/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class FinanceCard extends StatelessWidget {
  const FinanceCard({
    Key? key,
    required this.finance,
    required this.onTap,
  }) : super(key: key);

  final Finance finance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 2.0,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      finance.jobType,
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.greyColor,
                      ),
                    ),
                    Spacer(),
                    Text(
                      finance.date,
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 10.0,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.greyColor,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        finance.jobTitle,
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      finance.amount,
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.greenColor,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            finance.company,
                            style: Okito.theme.textTheme.bodyText2!.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          const RatingStars(score: 4.5),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: onTap,
                      child: Text(
                        "Invoice",
                        style: Okito.theme.textTheme.bodyText2!.copyWith(
                          fontSize: 10.0,
                          color: Okito.theme.primaryColor,
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
