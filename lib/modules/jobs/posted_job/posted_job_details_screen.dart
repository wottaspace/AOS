import 'package:arcopen_enquirer/core/models/applicant.dart';
import 'package:arcopen_enquirer/core/models/project.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:arcopen_enquirer/widgets/misc/member_card.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:arcopen_enquirer/widgets/navigation/expanded_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:readmore/readmore.dart';

class PostedJobDetailsScreen extends StatefulWidget {
  const PostedJobDetailsScreen({Key? key}) : super(key: key);

  @override
  _PostedJobDetailsScreenState createState() => _PostedJobDetailsScreenState();
}

class _PostedJobDetailsScreenState extends State<PostedJobDetailsScreen> {
  Project? job;
  @override
  void initState() {
    super.initState();
    job = Okito.arguments["job"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpandedAppBar(
                company: job!.companyName,
                jobTitle: job!.businessName,
                duration: "${job!.daysRemaining} Days",
                type: "TEMPORARY",
                location: job!.city,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(title: "DESCRIPTION"),
                    SizedBox(height: 10),
                    ReadMoreText(
                      "todo",
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    KTextField.soft(
                      label: "JOB TYPE",
                      hintText: job!.businessName,
                    ),
                    SizedBox(height: 10),
                    KTextField.soft(label: "BUDGET", hintText: job!.budget),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: KTextField.soft(
                            label: "START DATE",
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: KTextField.soft(
                            label: "END DATE",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: KTextField.soft(label: "START TIME"),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: KTextField.soft(label: "END TIME"),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SectionTitle(title: "APPLICANTS"),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: job!.applicantsArray.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        Applicant applicant = job!.applicantsArray[index];
                        return MemberCard(
                          username: applicant.applicantName!,
                          score: applicant.rating ?? 0,
                          hideLikeButton: true,
                          applicant: applicant,
                          hourlyRate: applicant.hourlyRate ?? "£0",
                          profilePic: applicant.profilePic!,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
