import 'package:arcopen_enquirer/widgets/dialogs/confirm_applicant_dialog.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:arcopen_enquirer/widgets/misc/expandable_text.dart';
import 'package:arcopen_enquirer/widgets/misc/member_card.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:arcopen_enquirer/widgets/navigation/expanded_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class PostedJobDetailsScreen extends StatefulWidget {
  const PostedJobDetailsScreen({Key? key}) : super(key: key);

  @override
  _PostedJobDetailsScreenState createState() => _PostedJobDetailsScreenState();
}

class _PostedJobDetailsScreenState extends State<PostedJobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpandedAppBar(
                company: "Express Security",
                jobTitle: "Talwar's Residency",
                duration: "11 March 2021",
                type: "TEMPORARY",
                location: "KITCHENER",
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(title: "DESCRIPTION"),
                    SizedBox(height: 10),
                    ExpandableText(
                      text: "Looking for a gate security guard. Should have a strong build, should be punctual, spontaneous, CRP certificate required. The shift will be from 11PM to 7AM in the morning.",
                    ),
                    SizedBox(height: 20),
                    KTextField.soft(label: "JOB TYPE"),
                    SizedBox(height: 10),
                    KTextField.soft(label: "BUDGET"),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: KTextField.soft(label: "START DATE"),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: KTextField.soft(label: "END DATE"),
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
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MemberCard(
                          username: "Harry Sahir",
                          score: 3.5,
                          hideLikeButton: true,
                          onTap: () {
                            showDialog(
                              context: context,
                              useSafeArea: true,
                              builder: (context) {
                                return AlertDialog(
                                  title: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Okito.pop();
                                        },
                                        iconSize: 10,
                                        icon: Icon(PhosphorIcons.x_bold),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Fund job for Talwar's Residency",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  content: ConfirmApplicantDialog(),
                                );
                              },
                            );
                          },
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
