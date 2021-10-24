class JobRequest {
  JobRequest(
      {required this.budget,
      required this.businessName,
      required this.jobType,
      required this.jobCategory,
      required this.shiftEndDate,
      required this.vacancies,
      required this.jobDescription,
      required this.shiftStartTime,
      required this.address,
      required this.shiftEndTime,
      required this.city,
      required this.contract,
      required this.emergencyRate,
      required this.fileName,
      required this.isDraft,
      required this.shiftStartDate,
      required this.shiftType});

  String businessName;
  String jobCategory;
  String jobType;
  String shiftType;
  String vacancies;
  String budget;
  String jobDescription;
  String shiftStartDate;
  String shiftEndDate;
  String shiftStartTime;
  String shiftEndTime;
  String address;
  String city;
  String isDraft;
  String emergencyRate;
  String fileName;
  String contract;

  Map<String, dynamic> toJson() {
    return {
      "business_name": businessName,
      "job_category": jobCategory,
      "job_type": jobType,
      "shift_type": shiftType,
      "vacancies": vacancies,
      "budget": budget,
      "job_description": jobDescription,
      "shift_start_date": shiftStartDate,
      "shift_end_date": shiftEndDate,
      "shift_start_time": shiftStartTime,
      "shift_end_time": shiftEndTime,
      "address": address,
      "city": city,
      "is_draft": isDraft,
      "emergency_rate": emergencyRate,
      "file_name": fileName,
      "contract": contract
    };
  }
}
