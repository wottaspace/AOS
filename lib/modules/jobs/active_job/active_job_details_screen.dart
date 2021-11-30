import 'package:arcopen_enquirer/config/routes/k_routes.dart';
import 'package:arcopen_enquirer/core/models/applicant.dart';
import 'package:arcopen_enquirer/core/models/project.dart';
import 'package:arcopen_enquirer/modules/jobs/job_details_controller.dart';
import 'package:arcopen_enquirer/utils/functions.dart';
import 'package:arcopen_enquirer/widgets/jobs/job_details_card.dart';
import 'package:arcopen_enquirer/widgets/misc/page_skeleton.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:arcopen_enquirer/widgets/navigation/expanded_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';
import 'package:readmore/readmore.dart';

class ActiveJobDetailsScreen extends StatefulWidget {
  const ActiveJobDetailsScreen({Key? key}) : super(key: key);

  @override
  _ActiveJobDetailsScreenState createState() => _ActiveJobDetailsScreenState();
}

class _ActiveJobDetailsScreenState extends State<ActiveJobDetailsScreen> {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle(title: "DESCRIPTION"),
                          const SizedBox(height: 10),
                          ReadMoreText(
                            _jobDetailsController.job?.jobDescription ?? "Loading...",
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          SectionTitle(title: "HIRED MEMBERS"),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ListView.builder(
                        itemCount: _jobDetailsController.applicants.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Applicant applicant = _jobDetailsController.applicants[index];
                          return JobDetailsCard(
                            username: applicant.applicantName!,
                            endTime: _jobDetailsController.job!.shiftEndTime,
                            startTime: _jobDetailsController.job!.shiftStartTime,
                            totalHours: getTotalHours(_jobDetailsController.job!.shiftEndTime, _jobDetailsController.job!.shiftStartTime),
                            date: _jobDetailsController.job!.shiftStartDate,
                            onTrailingPressed: () {
                              Okito.pushNamed(KRoutes.activeJobMemberDetailsRoute, arguments: {"job": _jobDetailsController.job, "applicant": applicant});
                            },
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
