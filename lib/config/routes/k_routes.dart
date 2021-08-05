import 'package:openarc_employer/modules/auth/login/login_screen.dart';
import 'package:openarc_employer/modules/auth/register/register_screen.dart';
import 'package:openarc_employer/modules/explore/main_screen.dart';
import 'package:openarc_employer/modules/finances/main_screen.dart';
import 'package:openarc_employer/modules/home_screen.dart';
import 'package:openarc_employer/modules/inbox/main_screen.dart';
import 'package:openarc_employer/modules/job/listing.dart';
import 'package:openarc_employer/modules/saved/main_screen.dart';
import 'package:openarc_employer/modules/splash_screen.dart';

import './k_route.dart';
import './k_router.dart';

///
/// Declaring Routes
///
class KRoutes {
  static final String homeRoute = "/home";
  static final String loginRoute = "/login";
  static final String registerRoute = "/register";
  static final String splashRoute = "/";
  static final String exploreRoute = "/explore";
  static final String inboxRoute = "/inbox";
  static final String jobListingRoute = "/jobList";
  static final String financeRoute = "/finance";
  static final String savedRoute = "/saved";

  static registerRoutes() {
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.splashRoute, page: SplashScreen(), isInitial: true));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.registerRoute, page: RegisterScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.loginRoute, page: LoginScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.homeRoute, page: HomeScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.jobListingRoute, page: JobListingScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.exploreRoute, page: ExploreScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.inboxRoute, page: InboxScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.financeRoute, page: FinanceScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.savedRoute, page: SavedScreen()));
  }
}
