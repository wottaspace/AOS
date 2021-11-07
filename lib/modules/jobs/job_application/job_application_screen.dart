import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/core/models/applicant.dart';
import 'package:arcopen_enquirer/modules/jobs/job_application/job_application_controller.dart';
import 'package:arcopen_enquirer/utils/navigation/k_app_bar.dart';
import 'package:arcopen_enquirer/widgets/buttons/k_button.dart';
import 'package:arcopen_enquirer/widgets/dialogs/confirm_applicant_dialog.dart';
import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:arcopen_enquirer/widgets/misc/member_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class JobApplicationScreen extends StatefulWidget {
  const JobApplicationScreen({Key? key}) : super(key: key);

  @override
  _JobApplicationScreenState createState() => _JobApplicationScreenState();
}

class _JobApplicationScreenState extends State<JobApplicationScreen> {
  Applicant? applicant;
  JobApplicationController _applicationController = JobApplicationController();

  @override
  void initState() {
    super.initState();
    applicant = Okito.arguments["applicant"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: applicant!.applicantName!,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              MemberCard(
                  hourlyRate: applicant!.hourlyRate ?? "£0",
                  username: applicant!.applicantName!,
                  score: applicant!.rating ?? 0,
                  profilePic: applicant!.profilePic!,
                  hideLikeButton: true,
                  clickable: false),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Offer Rate"),
                  Spacer(),
                  Text("${applicant!.hourlyRate}/hr"),
                ],
              ),
              SizedBox(height: 20),
              KTextField.soft(
                label: "MESSAGE TO EMPLOYER",
                minLines: 5,
                maxLines: 5,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            KButton(
              onPressed: () {
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
                              "Fund job for ${applicant!.applicantName}",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      content: ConfirmApplicantDialog(applicant: applicant),
                    );
                  },
                );
              },
              title: "CONFIRM",
              color: ColorConstants.greenColor,
              expanded: true,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: KButton.outlined(
                    onPressed: () {},
                    title: "CONTACT",
                    color: Okito.theme.primaryColor,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: KButton.outlined(
                    onPressed: () => _applicationController
                        .rejectApplication(applicant!.memberId!),
                    title: "DECLINE",
                    color: ColorConstants.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
