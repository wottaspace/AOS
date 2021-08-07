import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/modules/widgets/profile/cv.dart';
import 'package:openarc_employer/modules/widgets/profile/review.dart';
import 'package:openarc_employer/modules/widgets/shared/grey_title.dart';
import 'package:openarc_employer/modules/widgets/shared/label_text_field.dart';
import 'package:openarc_employer/modules/widgets/shared/outline_button.dart'
    as outlineButton;
import 'package:openarc_employer/utils/helpers/asset_helper.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List reviews = FakeData.userReviews();
  List cvs = FakeData.cvData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.primary,
      appBar: customAppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: LabelTextField(
                label: 'Badge Number',
                hint: "2222-2222-2222-2222",
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: LabelTextField(
                label: 'About',
                maxLines: 3,
                hint:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididut ut labare et dolore magna aliqua.',
              ),
            ),
            SizedBox(height: 20),
            Container(
                height: 105,
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: KColor.primary.withOpacity(.2)),
                    borderRadius: BorderRadius.circular(8)),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cvs.length,
                  itemBuilder: (context, index) {
                    Map cv = cvs[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == 0 ? 5.0 : 0.0),
                      child: CvCard(cv: cv),
                    );
                  },
                )),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: LabelTextField(
                      label: 'AVAILABILITY',
                      hint: "14Nov - 02Jan",
                    )),
                    Expanded(
                        child: LabelTextField(
                      label: 'LANDLINE',
                      hint: 'xxx-xxxxxxx',
                    )),
                  ],
                )),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: LabelTextField(
                      label: 'CONTACT*',
                      hint: 'xxx-xxx-xxx',
                    )),
                    Expanded(
                        child: LabelTextField(
                      label: 'EXPECTED RATE',
                      hint: "£20/hr",
                    )),
                  ],
                )),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: LabelTextField(
                label: 'ADDRESS',
                hint: '45 High Street, Waterloo,ON',
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("REVIEWS",
                  style: context.textTheme.headline6?.copyWith(
                      letterSpacing: 2,
                      color: KColor.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 20),
            Container(
              height: 220,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: reviews.length > 2 ? 2 : reviews.length,
                  itemBuilder: (context, index) {
                    Map review = reviews[index];
                    return ReviewCards(review: review, index: index);
                  }),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  'SEE ALL',
                  style: context.textTheme.bodyText1?.copyWith(
                    color: KColor.primary,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GreyTitleScreen(label: 'LOCATION')),
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
              child: outlineButton.OutlinedButton(
                label: "CONTACT PERSON",
                color: KColor.grey,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: outlineButton.OutlinedButton(
                label: "CONFIRM PERSON",
              ),
            ),
            SizedBox(height: 100),
          ],
        )),
      ),
    );
  }

  PreferredSize customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                  onTap: KRouter().pop,
                  child: Icon(Icons.arrow_back_ios, size: 25)),
              SizedBox(width: 15),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      AssetHelper.getAsset(name: 'avatar.jpg'),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Harry Sahir',
                    style: context.textTheme.headline3?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  ShowingStars(
                    stars: 4,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
          actions: [Icon(Icons.more_vert, size: 30), SizedBox(width: 10)],
        ),
      ),
    );
  }
}
