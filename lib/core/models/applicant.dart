class Applicant {
  Applicant({
    required this.applicantName,
    required this.applicationId,
    required this.hourlyRate,
    required this.memberId,
    required this.profilePic,
    required this.rating,
  });

  String applicantName;
  int applicationId;
  String hourlyRate;
  int memberId;
  String profilePic;
  double rating;

  factory Applicant.fromJson(Map<String, dynamic> json) => Applicant(
        applicantName: json["applicant_name"],
        applicationId: json["application_id"],
        hourlyRate: json["hourly_rate"],
        memberId: json["member_id"],
        profilePic: json["profile_pic"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "applicant_name": applicantName,
        "application_id": applicationId,
        "hourly_rate": hourlyRate,
        "member_id": memberId,
        "profile_pic": profilePic,
        "rating": rating,
      };
}
