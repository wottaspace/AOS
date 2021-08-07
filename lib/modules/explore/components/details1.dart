import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/modules/widgets/shared/label_text_field.dart';
import 'package:openarc_employer/modules/widgets/shared/rounded_button.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';
import 'package:openarc_employer/modules/widgets/shared/outline_button.dart'
    as outlineButton;

class Details1Screen extends StatelessWidget {
  const Details1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            KRoundedButton(
              label: 'CONFIRM',
              width: double.infinity,
              color: Colors.green,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: outlineButton.OutlinedButton(
                    label: 'CONTACT',
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: outlineButton.OutlinedButton(
                    label: 'DECLINE',
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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
                                          fontWeight: FontWeight.bold,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Offer Rate',
                    style: context.textTheme.headline5?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '£10/hr',
                    style: context.textTheme.headline5?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: LabelTextField(
                  label: 'MESSAGE TO EMPLOYER',
                  maxLines: 7,
                  hint:
                      'Lorem ipsum dolor sit amet, consectetur adpiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                )),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
