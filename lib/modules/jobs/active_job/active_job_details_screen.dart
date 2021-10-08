import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/widgets/jobs/job_details_card.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:arcopen_enquirer/widgets/navigation/expanded_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class ActiveJobDetailsScreen extends StatefulWidget {
  const ActiveJobDetailsScreen({Key? key}) : super(key: key);

  @override
  _ActiveJobDetailsScreenState createState() => _ActiveJobDetailsScreenState();
}

class _ActiveJobDetailsScreenState extends State<ActiveJobDetailsScreen> {
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
                    return JobDetailsCard(
                      username: "Harry Sahir",
                      endTime: "08 AM",
                      startTime: "10 PM",
                      totalHours: "9 hrs",
                      date: "11 Mar, 2021",
                      onTrailingPressed: index.isEven ? null : () {
                        Okito.pushNamed(KRoutes.activeJobMemberDetailsRoute);
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
