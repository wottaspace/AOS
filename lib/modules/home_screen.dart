import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openarc_employer/config/routes/k_router.dart';
import 'package:openarc_employer/config/routes/k_routes.dart';
import 'package:openarc_employer/modules/explore/main_screen.dart';
import 'package:openarc_employer/modules/finances/main_screen.dart';
import 'package:openarc_employer/modules/inbox/main_screen.dart';
import 'package:openarc_employer/modules/job/listing.dart';
import 'package:openarc_employer/modules/saved/main_screen.dart';
import 'package:openarc_employer/modules/widgets/shared/avatar_circle.dart';
import 'package:openarc_employer/modules/widgets/shared/drawer_item.dart';
import 'package:openarc_employer/modules/widgets/shared/navigation_bar.dart';
import 'package:openarc_employer/utils/extensions/build_context.dart';
import 'package:openarc_employer/modules/widgets/shared/image_icon.dart'
    as imageIcon;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller = PageController();
  int currentIndex = 0;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  List titles = [
    "Explore Members",
    "Inbox",
    "Job Listings",
    "Finances",
    "Saved"
  ];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        key: key,
        drawer: Container(
          height: context.customSize.height,
          width: context.customSize.width,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 70, 0, 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: KRouter().pop,
                      child: Icon(Icons.close),
                    ),
                    AvatarIcon()
                  ],
                ),
              ),
              SizedBox(height: 30),
              KDrawerItem(
                  onTap: () => KRouter().push(KRoutes.subscriptionRoute),
                  icon: "file.png",
                  label: "Subscription"),
              SizedBox(height: 10),
              KDrawerItem(
                  onTap: () => KRouter().push(KRoutes.settingsRoute),
                  icon: "settings.png",
                  label: "Settings"),
              SizedBox(height: 10),
              KDrawerItem(
                  onTap: () => KRouter().push(KRoutes.disputeResolutionRoute),
                  icon: "judge.png",
                  label: "Disputes"),
              SizedBox(height: 10),
              KDrawerItem(
                  onTap: () => KRouter().push(KRoutes.jobDetailsRoute),
                  icon: "globe.png",
                  label: "Support"),
              SizedBox(height: 10),
              KDrawerItem(
                  onTap: () => KRouter().push(KRoutes.loginRoute),
                  icon: "exit.png",
                  label: "Logout"),
              SizedBox(height: 10),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            leading: imageIcon.ImageIcon(
              uri: "menu.png",
              onTap: () => key.currentState!.openDrawer(),
            ),
            title: Text(
              titles[currentIndex],
              style: context.textTheme.headline1?.copyWith(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              imageIcon.ImageIcon(uri: 'clock_notification.png'),
              SizedBox(width: 10),
              AvatarIcon(),
              SizedBox(width: 10),
            ],
          ),
        ),
        bottomNavigationBar: KNavigationBar(
          index: currentIndex,
          onTap: (value) {
            _controller.jumpToPage(value);
            setState(() => currentIndex = value);
          },
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            ExploreScreen(),
            InboxScreen(),
            JobListingScreen(),
            FinanceScreen(),
            SavedScreen()
          ],
        ),
      ),
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
