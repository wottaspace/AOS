import 'package:flutter/material.dart';
import 'package:openarc_employer/constants/colors.dart';
import 'package:openarc_employer/constants/fake_data.dart';
import 'package:openarc_employer/modules/widgets/finances/showing_stars.dart';
import 'package:openarc_employer/modules/widgets/shared/avatar_circle.dart';
import 'package:openarc_employer/modules/widgets/shared/search.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;
import 'package:openarc_employer/utils/helpers/asset_helper.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List locations = FakeData.exploreLabels();
  List cards = FakeData.exploreCards();
  List members = FakeData.exploreMembers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          leading: imageIcon.ImageIcon(uri: "menu.png"),
          title: Text(
            'Explore Members',
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
            Search(),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  Map location = locations[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 15 : 0,
                        right: index == locations.length - 1 ? 15 : 5),
                    child: LocationLabel(location: location),
                  );
                },
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                'HIGH RATED',
                style: context.textTheme.subtitle1?.copyWith(
                    fontSize: 13,
                    color: KColor.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  Map card = cards[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 15 : 0,
                        right: index == cards.length - 1 ? 15 : 10),
                    child: Container(
                      height: 200,
                      width: 310,
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
                      decoration: BoxDecoration(
                          color: card['color'],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      AssetHelper.getAsset(
                                          name: card['avatar']),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    '${card['name']}',
                                    style: context.textTheme.bodyText1
                                        ?.copyWith(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                  ),
                                  SizedBox(height: 4),
                                  ShowingStars(stars: card['ratings'])
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.pin_drop_outlined,
                                  size: 15, color: Colors.white),
                              SizedBox(width: 10),
                              Text(card['location'],
                                  style: context.textTheme.bodyText1?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 133,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white12,
                              ),
                              child: Text('VIEW PROFILE',
                                  style: context.textTheme.bodyText1?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'ALL MEMBERS',
                style: context.textTheme.subtitle1?.copyWith(
                    fontSize: 13,
                    color: KColor.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Map data = members[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.only(left: 15, right: 25),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    AssetHelper.getAsset(name: data['avatar']),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data['name']}',
                                    style:
                                        context.textTheme.headline5?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  ShowingStars(stars: data['ratings'])
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: '${data['price']}',
                                        style: context.textTheme.headline5
                                            ?.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: KColor.primary,
                                        ),
                                        children: [
                                      TextSpan(
                                        text: '/hr',
                                        style: context.textTheme.headline5
                                            ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: KColor.grey,
                                        ),
                                      )
                                    ])),
                                SizedBox(height: 5),
                                data['favorite']
                                    ? imageIcon.ImageIcon(
                                        uri: 'favorite_colored.png',
                                      )
                                    : imageIcon.ImageIcon(uri: 'favorite.png')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationLabel extends StatelessWidget {
  const LocationLabel({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Map location;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(location['icon'], size: 15, color: KColor.grey),
            SizedBox(width: 8),
            Text(
              '${location['name']}',
              style: context.textTheme.headline6?.copyWith(
                  color: KColor.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}

class LabelLocation extends StatelessWidget {
  const LabelLocation({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(data["icon"], size: 15, color: data["color"]),
          SizedBox(width: 8),
          Text(
            '${data['name']}',
            style: context.textTheme.headline6?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: data["color"]),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: data["color"].withOpacity(.1),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
