import 'package:arcopen_enquirer/core/models/finance.dart';

class FinanceResponse {
  FinanceResponse(
      {required this.funded,
      required this.paidTransactions,
      required this.totalJobs,
      required this.totalPaid,
      required this.unpaidTransactions});

  String funded;
  List<Finance> paidTransactions;
  String totalJobs;
  String totalPaid;
  List<Finance> unpaidTransactions;

  factory FinanceResponse.fromJson(Map<String, dynamic> json) {
    return FinanceResponse(
      funded: json["funded"],
      totalJobs: json["total_jobs"],
      totalPaid: json["total_paid"],
      paidTransactions: List<Finance>.from(
          json['paid_transactions'].map((e) => Finance.fromJson(e))),
      unpaidTransactions: List<Finance>.from(
          json['unpaid_transactions'].map((e) => Finance.fromJson(e))),
    );
  }
}
