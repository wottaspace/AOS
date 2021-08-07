import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/modules/widgets/shared/details_item.dart';
import 'package:openarc_employer/modules/widgets/shared/grey_title.dart';
import 'package:openarc_employer/modules/widgets/shared/rounded_button.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class Details2Screen extends StatelessWidget {
  const Details2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 100,
                  padding: EdgeInsets.only(left: 15, right: 25),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              AssetHelper.getAsset(name: 'avatar.jpg'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sameer Mahajan',
                                  style: context.textTheme.headline5?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: '£20',
                                        style: context.textTheme.headline5
                                            ?.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: KColor.primary,
                                        ),
                                        children: [
                                      TextSpan(
                                        text: '/hr',
                                        style: context.textTheme.headline5
                                            ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: KColor.grey,
                                        ),
                                      )
                                    ])),
                              ],
                            ),
                            SizedBox(height: 5),
                            ShowingStars(stars: 4)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GreyTitleScreen(label: 'Location'),
            ),
            SizedBox(height: 10),
            Container(
              height: 220,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GreyTitleScreen(
                label: 'JOBS',
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => KRouter().push(KRoutes.jobDetailsUserRoute),
              child: Container(
                height: 285,
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.only(top: 8, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Jan 16th, 2021',
                        style: context.textTheme.bodyText1?.copyWith(
                            fontSize: 16.4,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: DetailsItem(
                                  label: "Start Time", value: "08 AM")),
                          Expanded(
                              child: DetailsItem(
                                  label: "End Time", value: "08 AM")),
                          Expanded(
                              child: DetailsItem(
                                  label: "Total Hours", value: "08 AM")),
                          Expanded(
                              child: DetailsItem(
                                  label: "Extra Hours", value: "08 AM")),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 120,
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2, color: KColor.grey.withOpacity(.3))),
                        color: KColor.grey.withOpacity(.1),
                      ),
                      alignment: Alignment.topCenter,
                      child: Text(
                        'How was your experience?',
                        style: context.textTheme.bodyText1?.copyWith(
                            fontSize: 16.4,
                            fontWeight: FontWeight.w300,
                            color: KColor.grey),
                      ),
                    ),
                    ShowingStars(
                      stars: 4,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomCenter,
              height: 85,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  KRoundedButton(
                    label: 'ACCEPT',
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
