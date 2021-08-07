import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/widgets/inbox/card.dart';
import 'package:openarc_employer/modules/widgets/shared/avatar_circle.dart';
import 'package:openarc_employer/modules/widgets/shared/search.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List datas = FakeData.inboxData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'ALL MESSAGES',
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
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                    child: InboxCards(data: data),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
