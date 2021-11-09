import 'package:arcopen_enquirer/core/models/applicant.dart';
import 'package:arcopen_enquirer/core/models/job.dart';

class JobDetailsResponse {
  JobDetailsResponse({
    required this.applicants,
    required this.jobDetails,
  });

  List<Applicant> applicants;
  List<Job> jobDetails;

  factory JobDetailsResponse.fromJson(Map<String, dynamic> json) {
    return JobDetailsResponse(applicants: List<Applicant>.from(json["applicants"].map((x) => Applicant.fromJson(x))), jobDetails: List<Job>.from(json['job_details'].map((x) => Job.fromJson(x))));
  }
}
