class Finance {
  Finance({
    required this.company,
    required this.jobTitle,
    required this.createdAt,
    required this.amount,
    required this.date,
    required this.jobType,
    required this.profilePicture,
  });

  final String? company;
  final String jobTitle;
  final String createdAt;
  final String amount;
  final String date;
  final String jobType;
  final String profilePicture;

  factory Finance.fromJson(Map<String, dynamic> json) {
    return Finance(
      company: json['company'],
      createdAt: json['created_at'],
      jobTitle: json['job_title'],
      jobType: json['job_type'],
      amount: json['amount'],
      date: json['date'],
      profilePicture: json['profile_pic'],
    );
  }
}
