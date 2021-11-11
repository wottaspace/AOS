import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/core/models/applicant.dart';
import 'package:arcopen_enquirer/core/models/project.dart';
import 'package:arcopen_enquirer/modules/jobs/job_details_controller.dart';
import 'package:arcopen_enquirer/utils/functions.dart';
import 'package:arcopen_enquirer/widgets/misc/member_card.dart';
import 'package:arcopen_enquirer/widgets/misc/page_skeleton.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:arcopen_enquirer/widgets/navigation/expanded_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:readmore/readmore.dart';

class HistoryJobDetailsScreen extends StatefulWidget {
  const HistoryJobDetailsScreen({Key? key}) : super(key: key);

  @override
  _HistoryJobDetailsScreenState createState() => _HistoryJobDetailsScreenState();
}

class _HistoryJobDetailsScreenState extends State<HistoryJobDetailsScreen> {
  Project? job;
  JobDetailsController _jobDetailsController = JobDetailsController();

  @override
  void initState() {
    job = Okito.arguments["job"];
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _jobDetailsController.loadJobDetails(jobId: job!.jobId);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Okito.arguments.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: OkitoBuilder(
            controller: _jobDetailsController,
            builder: () {
              return PageSkeleton(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpandedAppBar(
                      company: _jobDetailsController.job?.companyName ?? "Loading...",
                      jobTitle: _jobDetailsController.job?.businessName ?? "Loading...",
                      duration: "${_jobDetailsController.job?.daysRemaining ?? 0} Days",
                      type: _jobDetailsController.job?.jobType ?? "Loading...",
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          _TotalHoursCard(
                            totalHours: getTotalHours(
                              _jobDetailsController.job?.shiftEndTime ?? "00:00",
                              _jobDetailsController.job?.shiftStartTime ?? "00:00",
                            ),
                          ),
                          SizedBox(width: 10),
                          _TotalAmountCard(
                            amount: _jobDetailsController.job?.budget ?? "0",
                          ),
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
                          ReadMoreText(
                            _jobDetailsController.job?.jobDescription ?? "Loading...",
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                        shrinkWrap: true,
                        itemCount: _jobDetailsController.applicants.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Applicant applicant = _jobDetailsController.applicants[index];
                          return MemberCard(
                            voidCallback: () {},
                            username: applicant.applicantName!,
                            score: applicant.rating ?? 0,
                            hideLikeButton: true,
                            applicant: applicant,
                            jobId: job!.jobId,
                            hourlyRate: applicant.hourlyRate ?? "£0",
                            profilePic: applicant.profilePic!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                controller: _jobDetailsController,
                retryCallback: () => _jobDetailsController.loadJobDetails(jobId: job!.jobId),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TotalHoursCard extends StatelessWidget {
  const _TotalHoursCard({Key? key, required this.totalHours}) : super(key: key);

  final String totalHours;

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
                "$totalHours",
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
  const _TotalAmountCard({Key? key, required this.amount}) : super(key: key);

  final String amount;

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
                "${amount.isEmpty ? '0' : amount}",
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
