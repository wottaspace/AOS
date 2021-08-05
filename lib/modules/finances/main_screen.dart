import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/widgets/finances/card.dart';
import 'package:openarc_employer/modules/widgets/finances/card_stats.dart';
import 'package:openarc_employer/modules/widgets/shared/avatar_circle.dart';
import 'package:openarc_employer/modules/widgets/shared/switch.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  List datas = FakeData.financesData();
  List titles = [
    {"id": 0, "name": "Paid"},
    {"id": 1, "name": "Unpaid"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: imageIcon.ImageIcon(uri: "menu.png"),
          title: Text(
            'Finances',
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
            Container(
              height: 150,
              margin:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
              child: Row(
                children: [
                  FinanceStatCards(
                    title: 'TOTAL PAID',
                    price: '£1080',
                    details: '20 Jobs till Jan 2020',
                    color: Colors.lightGreenAccent[700],
                  ),
                  SizedBox(width: 10),
                  FinanceStatCards(
                    title: 'FUNDED',
                    price: '£800',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: KSwitch(titles: titles),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'TRANSACTIONS',
                      style: context.textTheme.subtitle1?.copyWith(
                          fontSize: 13,
                          color: KColor.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('January'),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  )
                ],
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
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: FinanceCard(data: data),
                  );
                })
          ],
        ),
      ),
    );
  }
}
