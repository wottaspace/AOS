import 'package:arcopen_enquirer/core/models/applicant.dart';
import 'package:arcopen_enquirer/core/models/job.dart';

class PostedJobDetails {
  PostedJobDetails({
    required this.applicants,
    required this.jobDetails,
  });

  List<Applicant> applicants;
  List<JobDetail> jobDetails;

  factory PostedJobDetails.fromJson(Map<String, dynamic> json) {
    return PostedJobDetails(
      applicants: List<Applicant>.from(json["applicants"].map((x) => Applicant.fromJson(x))),
      jobDetails: List<JobDetail>.from(json["job_details"].map((x) => JobDetail.fromJson(x))),
    );
  }
}
