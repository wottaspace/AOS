import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/saved/components/drafts.dart';
import 'package:openarc_employer/modules/saved/components/saved_member.dart';
import 'package:openarc_employer/modules/widgets/saved/card.dart';
import 'package:openarc_employer/modules/widgets/shared/switch.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  int currentView = 1;
  List datas = FakeData.savedDraftsData();
  List titles = [
    {"id": 0, "name": "Drafts Jobs"},
    {"id": 1, "name": "Saved Members"},
  ];
  onSwitch() {
    if (currentView == 1)
      setState(() => currentView = 2);
    else
      setState(() => currentView = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
              child: KSwitch(
                titles: titles,
                onSwitch: onSwitch,
              ),
            ),
            currentView == 1
                ? DraftComponent(datas: datas)
                : SavedMemberComponent(datas: datas)
          ],
        ),
      ),
    );
  }
}
