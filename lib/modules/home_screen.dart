import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openarc_employer/modules/explore/main_screen.dart';
import 'package:openarc_employer/modules/finances/main_screen.dart';
import 'package:openarc_employer/modules/inbox/main_screen.dart';
import 'package:openarc_employer/modules/job/listing.dart';
import 'package:openarc_employer/modules/saved/main_screen.dart';
import 'package:openarc_employer/modules/widgets/shared/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        bottomNavigationBar: KNavigationBar(
          index: currentIndex,
          onTap: (value) {
            _controller.jumpToPage(value);
            setState(() => currentIndex = value);
          },
        ),
        body: PageView(
          allowImplicitScrolling: false,
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
