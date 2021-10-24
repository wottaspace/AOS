import 'package:arcopen_enquirer/http/responses/get_members_response.dart';

class ExploreMembersResponse {
  ExploreMembersResponse({
    required this.allMembers,
    required this.highRated,
  });

  List<Member> allMembers;
  List<Member> highRated;

  factory ExploreMembersResponse.fromJson(Map<String, dynamic> json) {
    return ExploreMembersResponse(
      allMembers:
          List<Member>.from(json["all_members"].map((x) => Member.fromJson(x))),
      highRated:
          List<Member>.from(json["high_rated"].map((x) => Member.fromJson(x))),
    );
  }
}
