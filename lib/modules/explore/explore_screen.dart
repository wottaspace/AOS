import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/http/responses/get_members_response.dart';
import 'package:arcopen_enquirer/modules/explore/explore_screen_controller.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:arcopen_enquirer/widgets/misc/k_chip.dart';
import 'package:arcopen_enquirer/widgets/misc/member_card.dart';
import 'package:arcopen_enquirer/widgets/misc/page_skeleton.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:arcopen_enquirer/widgets/misc/top_rated_member_card.dart';
import 'package:arcopen_enquirer/widgets/states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      ExploreScreenController.shared.loadMembers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OkitoBuilder(
            controller: ExploreScreenController.shared,
            builder: () {
              return PageSkeleton(
                retryCallback: ExploreScreenController.shared.loadMembers,
                controller: ExploreScreenController.shared,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          KTextField.circular(
                            hintText: "Search",
                            leading: PhosphorIcons.magnifying_glass,
                            controller:
                                ExploreScreenController.shared.searchController,
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
                        ],
                      ),
                    ),
                    if (ExploreScreenController
                        .shared.topRatedMembers.isNotEmpty) ...[
                      SectionTitle(title: "HIGH RATED"),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...ExploreScreenController.shared.topRatedMembers
                                .map<Widget>((member) {
                              return TopRatedMemberCard(
                                username: member.memberName,
                                score: member.rating,
                                profilePic: member.profilePic,
                                location: member.city,
                                onTap: () {
                                  Okito.pushNamed(KRoutes.applicantProfileRoute,
                                      arguments: {
                                        "member": member,
                                      });
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                    if (ExploreScreenController.shared.allMembers.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            SectionTitle(title: "ALL MEMBERS"),
                            SizedBox(height: 10),
                            ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final Member member = ExploreScreenController
                                    .shared.allMembers[index];
                                return MemberCard(
                                  hourlyRate: "14",
                                  username: member.memberName,
                                  score: member.rating,
                                  profilePic: member.profilePic,
                                );
                              },
                            )
                          ],
                        ),
                      )
                    else
                      EmptyState(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
