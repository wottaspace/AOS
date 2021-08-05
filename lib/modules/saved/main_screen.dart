import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/widgets/saved/card.dart';
import 'package:openarc_employer/modules/widgets/shared/avatar_circle.dart';
import 'package:openarc_employer/modules/widgets/shared/switch.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List datas = FakeData.savedDraftsData();
  List titles = [
    {"id": 0, "name": "Drafts Jobs"},
    {"id": 1, "name": "Saved Members"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: imageIcon.ImageIcon(uri: "menu.png"),
          title: Text(
            'Saved',
            style: context.textTheme.headline1?.copyWith(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: null,
                icon: Icon((Icons.notifications),
                    color: Colors.black26, size: 30)),
            SizedBox(width: 10),
            AvatarIcon(),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
              child: KSwitch(titles: titles),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'DRAFTS',
                style: context.textTheme.subtitle1?.copyWith(
                    fontSize: 13,
                    color: KColor.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: datas.length,
                itemBuilder: (context, index) {
                  var data = datas[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 1),
                    child: SavedCard(data: data),
                  );
                })
          ],
        ),
      ),
    );
  }
}
