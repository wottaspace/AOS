import 'package:arcopen_enquirer/modules/auth/change_password/change_password_screen.dart';
import 'package:arcopen_enquirer/modules/auth/login/login_screen.dart';
import 'package:arcopen_enquirer/modules/auth/register/register_screen.dart';
import 'package:arcopen_enquirer/modules/auth/reset_password/reset_password_screen.dart';
import 'package:arcopen_enquirer/modules/auth/reset_password/reset_password_success_screen.dart';
import 'package:arcopen_enquirer/modules/home_screen.dart';
import 'package:arcopen_enquirer/modules/settings/bank_details/bank_details_screen.dart';
import 'package:arcopen_enquirer/modules/settings/settings_screen.dart';
import 'package:arcopen_enquirer/modules/splash_screen/splash_screen.dart';
import 'package:arcopen_enquirer/modules/start_screen.dart';
import 'package:arcopen_enquirer/modules/subscription/add_card/add_card_screen.dart';
import 'package:arcopen_enquirer/modules/subscription/choose_plan_screen.dart';
import 'package:arcopen_enquirer/modules/subscription/payment/pay_screen.dart';
import 'package:arcopen_enquirer/modules/subscription/upgrade_plan_screen.dart';
import './k_route.dart';
import './k_router.dart';

///
/// Declaring Routes
///
class KRoutes {
  static final String splashRoute = "/";
  static final String stepperRoute = "/intro";

  static final String homeRoute = "/home";
  static final String loginRoute = "/login";
  static final String registerRoute = "/register";
  static final String resetPasswordRoute = "/reset-password-route";
  static final String resetPasswordSuccessRoute = "/reset-password-success-route";
  static final String changePasswordRoute = "/change-password";

  // Subscription routes
  static final String choosePlanRoute = "/choose-plan";
  static final String upgradePlanRoute = "/upgrade-plan";

  static final String bankDetailsRoute = "/bank-details";

  static final String exploreRoute = "/explore";
  static final String inboxRoute = "/inbox";
  static final String jobListingRoute = "/job-list";
  static final String financeRoute = "/finance";
  static final String savedRoute = "/saved";
  static final String messageSendRoute = "/message-send";
  static final String userProfileRoute = "/user-profile";
  static final String companyProfileRoute = "/company-profile";

  static final String settingsRoute = "/settings";
  static final String payRoute = "/pay";
  static final String addPaymentMethodRoute = "/add-payment-method-route";

  static registerRoutes() {
    KRouter().registerRoute(route: KRoute(name: KRoutes.splashRoute, page: SplashScreen(), isInitial: true));
    KRouter().registerRoute(route: KRoute(name: KRoutes.stepperRoute, page: StartScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.registerRoute, page: RegisterScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.loginRoute, page: LoginScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.homeRoute, page: HomeScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.resetPasswordRoute, page: ResetPasswordScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.resetPasswordSuccessRoute, page: ResetPasswordSuccessScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.changePasswordRoute, page: ChangePasswordScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.settingsRoute, page: SettingsScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.addPaymentMethodRoute, page: AddCardScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.payRoute, page: PayScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.bankDetailsRoute, page: BankDetailsScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.addPaymentMethodRoute, page: AddCardScreen()));

    KRouter().registerRoute(route: KRoute(name: KRoutes.choosePlanRoute, page: ChoosePlanScreen()));
    KRouter().registerRoute(route: KRoute(name: KRoutes.upgradePlanRoute, page: UpgradePlanScreen()));
  }
}
