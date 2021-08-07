import 'package:flutter/material.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/modules/widgets/shared/details_item.dart';
import 'package:openarc_employer/modules/widgets/shared/grey_title.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class JobDetailsUserScreen extends StatefulWidget {
  const JobDetailsUserScreen({Key? key}) : super(key: key);

  @override
  _JobDetailsUserScreenState createState() => _JobDetailsUserScreenState();
}

class _JobDetailsUserScreenState extends State<JobDetailsUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: GreyTitleScreen(
                label: 'Jobs',
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: JobCardDetails(),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: JobCardDetails(),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: JobCardDetails(),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: JobCardDetails(
                bottom: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'He was punctual and well behaved',
                        style: context.textTheme.headline3?.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      ShowingStars(stars: 4, size: 22),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25)
          ],
        ),
      ),
    );
  }

  PreferredSize customAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                  onTap: KRouter().pop,
                  child: Icon(Icons.arrow_back_ios,
                      color: Colors.black, size: 25)),
              SizedBox(width: 15),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      AssetHelper.getAsset(name: 'avatar.jpg'),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sameer Mahajan',
                    style: context.textTheme.headline3?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  ShowingStars(
                    stars: 4,
                  ),
                ],
              )
            ],
          ),
          actions: [
            Icon(Icons.more_vert, color: Colors.black, size: 30),
            SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}

class JobCardDetails extends StatelessWidget {
  const JobCardDetails({Key? key, this.bottom}) : super(key: key);

  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 17),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Talwar\'s Residency',
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.headline3?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Jan 16th, 2021',
                  style: context.textTheme.headline3?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: DetailsItem(label: 'Start Time', value: '08 AM')),
                Expanded(
                    child: DetailsItem(label: 'Start Time', value: '08 AM')),
                Expanded(
                    child: DetailsItem(label: 'Start Time', value: '08 AM')),
                Expanded(
                    child: DetailsItem(label: 'Start Time', value: '08 AM'))
              ],
            ),
            if (bottom != null) ...[
              Column(
                children: [SizedBox(height: 10), bottom!],
              )
            ]
          ],
        ),
      ),
    );
  }
}
