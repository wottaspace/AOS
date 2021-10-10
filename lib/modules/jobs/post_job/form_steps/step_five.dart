import 'package:arcopen_enquirer/widgets/forms/k_text_field.dart';
import 'package:arcopen_enquirer/widgets/misc/invite_member_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class StepFive extends StatelessWidget {
  StepFive({
    Key? key,
    required this.onNextButtonTapped,
    required this.onSaveDraftsTapped,
  }) : super(key: key);

  final Function onSaveDraftsTapped;
  final Function onNextButtonTapped;

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: ListView(
        children: [
          SizedBox(height: 20),
          KTextField.circular(
            hintText: "Search",
            leading: PhosphorIcons.magnifying_glass,
            controller: searchController,
          ),
          SizedBox(height: 20),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InviteMemberCard(
                username: "Harry Sahir",
                score: 3.5,
                onTap: () {},
                isInvited: index == 3,
              );
            },
          )
        ],
      ),
    );
  }
}
