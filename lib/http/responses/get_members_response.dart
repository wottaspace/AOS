class GetMembersResponse {
  GetMembersResponse({
    required this.allMembers,
    required this.highRated,
  });

  List<Member> allMembers;
  List<Member> highRated;

  factory GetMembersResponse.fromJson(Map<String, dynamic> json) => GetMembersResponse(
        allMembers: List<Member>.from(json["all_members"].map((x) => Member.fromJson(x))),
        highRated: List<Member>.from(json["high_rated"].map((x) => Member.fromJson(x))),
      );
}

class Member {
  Member({
    required this.city,
    required this.memberId,
    required this.memberName,
    required this.perHourRate,
    required this.profilePic,
    required this.rating,
    required this.saved,
  });

  String city;
  int memberId;
  String memberName;
  String perHourRate;
  String profilePic;
  double rating;
  bool saved;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        city: json["city"],
        memberId: json["member_id"],
        memberName: json["member_name"],
        perHourRate: json["per_hour_rate"],
        profilePic: json["profile_pic"],
        rating: json["rating"].toDouble(),
        saved: json["saved"],
      );
}
