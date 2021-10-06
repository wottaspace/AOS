import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/modules/explore/explore_screen_controller.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:arcopen_enquirer/widgets/misc/k_chip.dart';
import 'package:arcopen_enquirer/widgets/misc/member_card.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:arcopen_enquirer/widgets/misc/top_rated_member_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ExploreScreenController controller = ExploreScreenController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            KTextField.circular(
              hintText: "Search",
              leading: PhosphorIcons.magnifying_glass,
              controller: controller.searchController,
            ),
            SizedBox(height: 20),
            Wrap(
              children: [
                KChip(
                  title: "Location",
                  icon: PhosphorIcons.map_pin_fill,
                  onTap: () {
                    Okito.pushNamed(KRoutes.locationFilterRoute);
                  },
                ),
                SizedBox(width: 10),
                KChip(
                  title: "Filter",
                  icon: PhosphorIcons.funnel_fill,
                  onTap: () {
                    Okito.pushNamed(KRoutes.filterRoute);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            SectionTitle(title: "HIGH RATED"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TopRatedMemberCard(
                    username: "Paul Taylor",
                    score: 4,
                    location: "KITCHENER",
                    onTap: () {
                      // TODO: go to user profile
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SectionTitle(title: "ALL MEMBERS"),
            SizedBox(height: 10),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return MemberCard(
                  username: "Harry Sahir",
                  score: 3,
                  onTap: () {
                    // TODO: go to user profile
                  }
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
