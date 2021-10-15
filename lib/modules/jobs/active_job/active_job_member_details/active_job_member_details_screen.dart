import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/utils/navigation/k_app_bar.dart';
import 'package:arcopen_enquirer/widgets/dialogs/raise_dispute_dialog.dart';
import 'package:arcopen_enquirer/widgets/misc/active_ts_item.dart';
import 'package:arcopen_enquirer/widgets/misc/member_card.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';

class ActiveJobMemberDetailsScreen extends StatefulWidget {
  const ActiveJobMemberDetailsScreen({Key? key}) : super(key: key);

  @override
  _ActiveJobMemberDetailsScreenState createState() => _ActiveJobMemberDetailsScreenState();
}

class _ActiveJobMemberDetailsScreenState extends State<ActiveJobMemberDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightBlue,
      appBar: KAppBar(
        title: "Talwar's Residency",
        menuItems: [
          NavbarMenuItem(
            name: "Raise Dispute",
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Raise A Dispute",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Okito.pop();
                          },
                          iconSize: 15,
                          icon: Icon(PhosphorIcons.x_bold),
                        ),
                      ],
                    ),
                    content: RaiseDisputeDialog(),
                  );
                },
              );
            },
          ),
          NavbarMenuItem(name: "Help", onTap: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              MemberCard(
                username: "Harry Sahir", 
                score: 3.5,
                profilePic: "", // TODO: fix this
                onTap: () {},
                hideLikeButton: true,
              ),
              SizedBox(height: 20),
              SectionTitle(title: "LOCATION"),
              SizedBox(height: 10),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ColorConstants.greyColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              SizedBox(height: 20),
              SectionTitle(title: "JOBS"),
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SectionTitle(
                            title: "START TIME",
                            hasBoldTitle: true,
                          ),
                          SizedBox(height: 5),
                          ActiveTSItem(title: "22 PM")
                        ],
                      ),
                      Column(
                        children: [
                          SectionTitle(
                            title: "END TIME",
                            hasBoldTitle: true,
                          ),
                          SizedBox(height: 5),
                          ActiveTSItem(title: "9 AM")
                        ],
                      ),
                      Column(
                        children: [
                          SectionTitle(
                            title: "TOTAL HOURS",
                            hasBoldTitle: true,
                          ),
                          SizedBox(height: 5),
                          ActiveTSItem(title: "10 hrs")
                        ],
                      ),
                      Column(
                        children: [
                          SectionTitle(
                            title: "EXTRA HOURS",
                            hasBoldTitle: true,
                          ),
                          SizedBox(height: 5),
                          ActiveTSItem(title: "9 hrs")
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
