class PostedProjectResponse {
  PostedProjectResponse({
    required this.applicants,
    required this.budget,
    required this.businessName,
    required this.city,
    required this.companyName,
    required this.daysRemaining,
    required this.jobId,
  });

  int applicants;
  String budget;
  String businessName;
  String city;
  String companyName;
  int daysRemaining;
  int jobId;

  factory PostedProjectResponse.fromJson(Map<String, dynamic> json) {
    return PostedProjectResponse(
      applicants: json["applicants"],
      budget: json["budget"],
      businessName: json["business_name"],
      city: json["city"],
      companyName: json["company_name"],
      daysRemaining: json["days_remaining"],
      jobId: json["job_id"],
    );
  }
}
