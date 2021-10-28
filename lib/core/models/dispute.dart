class Dispute {
  Dispute({
    required this.createdOn,
    required this.description,
    required this.disputeType,
    required this.id,
    required this.active,
  });

  final String createdOn;
  final String description;
  final String disputeType;
  final int id;
  final bool active;

  factory Dispute.fromJson(Map<String, dynamic> json) {
    return Dispute(
        createdOn: json['created_on'],
        description: json['description'],
        disputeType: json['dispute_type'],
        id: json['id'],
        active: json['active'] == "active" ? true : false);
  }
}
