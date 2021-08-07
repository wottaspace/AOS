import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/widgets/shared/grey_title.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';

class DisputeResolutionScreen extends StatelessWidget {
  const DisputeResolutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List openDisputes =
        FakeData.disputeData().where((e) => e['closed'] == false).toList();
    final List closeDisputes =
        FakeData.disputeData().where((e) => e['closed'] == true).toList();

    return Scaffold(
        appBar: customAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GreyTitleScreen(label: 'open'),
              ),
              SizedBox(height: 7),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: openDisputes.length,
                itemBuilder: (context, index) {
                  Map dispute = openDisputes[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 3),
                    child: DisputeCard(dispute: dispute),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GreyTitleScreen(label: 'Closed'),
              ),
              SizedBox(height: 7),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: closeDisputes.length,
                itemBuilder: (context, index) {
                  Map dispute = closeDisputes[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 3),
                    child: DisputeCard(dispute: dispute),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }

  PreferredSize customAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(90),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 30.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(width: 10),
              GestureDetector(
                  onTap: KRouter().pop,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black54,
                  )),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Dispute Resolution',
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.headline3?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => KColor.primary.withOpacity(.1),
                      )),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: KColor.primary,
                        size: 11,
                      ),
                      SizedBox(width: 2),
                      Text(
                        'ADD DISPUTE',
                        style: context.textTheme.headline1?.copyWith(
                          fontSize: 10,
                          color: KColor.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class DisputeCard extends StatelessWidget {
  const DisputeCard({
    required this.dispute,
    Key? key,
  }) : super(key: key);

  final Map dispute;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dispute['closed'] ? Colors.green : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${dispute['title']}',
                    style: context.textTheme.bodyText1?.copyWith(
                      fontSize: 17,
                      color: dispute['closed'] ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  '${dispute['date']}',
                  style: context.textTheme.bodyText1?.copyWith(
                    fontSize: 14,
                    color: dispute['closed'] ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Container(
              width: context.customSize.width / 1.8,
              child: Text(
                '${dispute['description']}',
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyText1?.copyWith(
                  fontSize: 13,
                  color: dispute['closed'] ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
