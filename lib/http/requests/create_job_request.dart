import 'package:arcopen_enquirer/http/requests/base_request.dart';

class CreateJobRequest extends BaseRequest {
  CreateJobRequest({
    this.businessName,
    this.jobCategory,
    this.jobType,
    this.shiftType,
    this.vacancies,
    this.budget,
    this.jobDescription,
    this.shiftStartDate,
    this.shiftEndDate,
    this.shiftStartTime,
    this.shiftEndTime,
    this.address,
    this.city,
    this.isDraft,
    this.emergencyRate,
    this.fileName,
    this.contract,
  });

  String? businessName;
  String? jobCategory;
  String? jobType;
  String? shiftType;
  String? vacancies;
  String? budget;
  String? jobDescription;
  DateTime? shiftStartDate;
  DateTime? shiftEndDate;
  String? shiftStartTime;
  String? shiftEndTime;
  String? address;
  String? city;
  String? isDraft;
  String? emergencyRate;
  String? fileName;
  String? contract;

  factory CreateJobRequest.fromJson(Map<String, dynamic> json) => CreateJobRequest(
        businessName: json["business_name"],
        jobCategory: json["job_category"],
        jobType: json["job_type"],
        shiftType: json["shift_type"],
        vacancies: json["vacancies"],
        budget: json["budget"],
        jobDescription: json["job_description"],
        shiftStartDate: DateTime.parse(json["shift_start_date"]),
        shiftEndDate: DateTime.parse(json["shift_end_date"]),
        shiftStartTime: json["shift_start_time"],
        shiftEndTime: json["shift_end_time"],
        address: json["address"],
        city: json["city"],
        isDraft: json["is_draft"],
        emergencyRate: json["emergency_rate"],
        fileName: json["file_name"],
        contract: json["contract"],
      );

  Map<String, dynamic> toJson() => {
        "business_name": businessName,
        "job_category": jobCategory,
        "job_type": jobType,
        "shift_type": shiftType,
        "vacancies": vacancies,
        "budget": budget,
        "job_description": jobDescription,
        "shift_start_date": "${shiftStartDate?.year.toString().padLeft(4, '0')}-${shiftStartDate?.month.toString().padLeft(2, '0')}-${shiftStartDate?.day.toString().padLeft(2, '0')}",
        "shift_end_date": "${shiftEndDate?.year.toString().padLeft(4, '0')}-${shiftEndDate?.month.toString().padLeft(2, '0')}-${shiftEndDate?.day.toString().padLeft(2, '0')}",
        "shift_start_time": shiftStartTime,
        "shift_end_time": shiftEndTime,
        "address": address,
        "city": city,
        "is_draft": isDraft,
        "emergency_rate": emergencyRate,
        "file_name": fileName,
        "contract": contract,
      };
}
