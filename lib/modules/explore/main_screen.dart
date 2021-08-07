import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/widgets/explore/high_rated_card.dart';
import 'package:openarc_employer/modules/widgets/explore/location_label.dart';
import 'package:openarc_employer/modules/widgets/explore/member_card.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/modules/widgets/shared/search.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List locations = FakeData.exploreLabels();
  List cards = FakeData.exploreCards();
  List members = FakeData.exploreMembers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search(),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  Map location = locations[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 15 : 0,
                        right: index == locations.length - 1 ? 15 : 5),
                    child: LocationLabel(
                        onTap: () => index == 0
                            ? KRouter().push(KRoutes.locationRoute)
                            : KRouter().push(KRoutes.filterRoute),
                        location: location),
                  );
                },
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                'HIGH RATED',
                style: context.textTheme.subtitle1?.copyWith(
                    fontSize: 13,
                    color: KColor.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  Map card = cards[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 15 : 0,
                        right: index == cards.length - 1 ? 15 : 10),
                    child: HighRatedExploreCard(card: card),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'ALL MEMBERS',
                style: context.textTheme.subtitle1?.copyWith(
                    fontSize: 13,
                    color: KColor.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: members.length,
              itemBuilder: (context, index) {
                Map data = members[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ExploreMemberCard(
                    data: data,
                    onTap: () =>
                        KRouter().push(KRoutes.detailsExploreMemberRoute),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
