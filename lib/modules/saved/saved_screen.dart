import 'package:arcopen_enquirer/constants/color_constants.dart';
import 'package:arcopen_enquirer/widgets/jobs/draft_job_card.dart';
import 'package:arcopen_enquirer/widgets/misc/member_card.dart';
import 'package:arcopen_enquirer/widgets/misc/section_title.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  void _updateActiveIndex(index) {
    setState(() {
      _selectedIndex = index;
      // TODO: toggle filter between paid and unpaid bills
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              height: 40,
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(8.0),
                borderWidth: 0,
                borderColor: Okito.theme.primaryColor,
                onPressed: (index) {
                  _updateActiveIndex(index);
                },
                children: [
                  Container(
                    color: _selectedIndex == 0 ? Okito.theme.primaryColor : Colors.white,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    alignment: Alignment.center,
                    child: Text(
                      "Draft Jobs",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _selectedIndex == 0 ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                  Container(
                    color: _selectedIndex == 1 ? Okito.theme.primaryColor : Colors.white,
                    width: MediaQuery.of(context).size.width * 0.4,
                    alignment: Alignment.center,
                    child: Text(
                      "Saved Members",
                      style: Okito.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12.0,
                        color: _selectedIndex == 1 ? Colors.white : ColorConstants.greyColor,
                      ),
                    ),
                  ),
                ],
                isSelected: [_selectedIndex == 0, _selectedIndex == 1],
              ),
            ),
            if (_selectedIndex == 0) const _DraftJobs(),
            if (_selectedIndex == 1) const _SavedMembers(),
          ],
        ),
      ),
    );
  }
}

class _DraftJobs extends StatelessWidget {
  const _DraftJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        SectionTitle(title: "DRAFTS"),
        SizedBox(height: 20),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return DraftJobCard(
              businessName: "Talwar's Residency",
              location: "KITCHENER",
              payRate: "\$20-\$25",
              contractType: "Express Security",
            );
          },
        ),
      ],
    );
  }
}

class _SavedMembers extends StatelessWidget {
  const _SavedMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        SectionTitle(title: "SAVED"),
        SizedBox(height: 20),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return MemberCard(
              score: 2,
              hidePayRate: true,
              onTap: () {},
              username: "Harry Sahir",
            );
          },
        ),
      ],
    );
  }
}
