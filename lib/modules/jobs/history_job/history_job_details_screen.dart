import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/widgets/misc/member_card.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:arcopen_enquirer/widgets/navigation/expanded_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class HistoryJobDetailsScreen extends StatefulWidget {
  const HistoryJobDetailsScreen({Key? key}) : super(key: key);

  @override
  _HistoryJobDetailsScreenState createState() => _HistoryJobDetailsScreenState();
}

class _HistoryJobDetailsScreenState extends State<HistoryJobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandedAppBar(
                company: "Express Security",
                jobTitle: "Talwar's Residency",
                duration: "11 March 2021",
                type: "TEMPORARY",
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    const _TotalHoursCard(),
                    SizedBox(width: 10),
                    const _TotalAmountCard(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(title: "DESCRIPTION"),
                    SizedBox(height: 10),
                    Text(
                      "Looking for a gate security guard. Should have a strong build, should be punctual, spontaneous, CRP certificate required. The shift will be from 11PM to 7AM in the morning.",
                    ),
                    SizedBox(height: 20),
                    SectionTitle(title: "HIRED MEMBERS"),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MemberCard(
                      username: "Harry Sahir",
                      score: 2.5,
                      profilePic: "", // TODO: fix this
                      timeCompleted: "15 hours",
                      hideLikeButton: true,
                      onTap: () {
                        Okito.pushNamed(KRoutes.historyJobMemberDetailsRoute);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TotalHoursCard extends StatelessWidget {
  const _TotalHoursCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: ColorConstants.lightBlue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TOTAL HOURS",
                style: Okito.theme.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "40",
                style: Okito.theme.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Okito.theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TotalAmountCard extends StatelessWidget {
  const _TotalAmountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: ColorConstants.lightBlue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "TOTAL AMOUNT",
                style: Okito.theme.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "\$800",
                style: Okito.theme.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: ColorConstants.greenColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
