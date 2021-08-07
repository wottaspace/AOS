import 'package:openarc_employer/modules/auth/login/login_screen.dart';
import 'package:openarc_employer/modules/auth/register/register_screen.dart';
import 'package:openarc_employer/modules/auth/reset_password/change_password.dart';
import 'package:openarc_employer/modules/auth/reset_password/forgot.dart';
import 'package:openarc_employer/modules/auth/reset_password/message_send.dart';
import 'package:openarc_employer/modules/disputes/dispute.dart';
import 'package:openarc_employer/modules/explore/details.dart';
import 'package:openarc_employer/modules/explore/main_screen.dart';
import 'package:openarc_employer/modules/finances/main_screen.dart';
import 'package:openarc_employer/modules/home_screen.dart';
import 'package:openarc_employer/modules/inbox/chat.dart';
import 'package:openarc_employer/modules/inbox/main_screen.dart';
import 'package:openarc_employer/modules/job/details.dart';
import 'package:openarc_employer/modules/job/job_details_modal.dart';
import 'package:openarc_employer/modules/job/job_details_user.dart';
import 'package:openarc_employer/modules/job/listing.dart';
import 'package:openarc_employer/modules/job/post_new_job.dart';
import 'package:openarc_employer/modules/job/success_funded_job.dart';
import 'package:openarc_employer/modules/lorem_ipsum_screen.dart';
import 'package:openarc_employer/modules/other_views/filter.dart';
import 'package:openarc_employer/modules/other_views/location.dart';
import 'package:openarc_employer/modules/payments/billing_methods.dart';
import 'package:openarc_employer/modules/payments/subscription.dart';
import 'package:openarc_employer/modules/payments/subscription_pack.dart';
import 'package:openarc_employer/modules/payments/subscription_pack_details.dart';
import 'package:openarc_employer/modules/profile/company.dart';
import 'package:openarc_employer/modules/profile/user.dart';
import 'package:openarc_employer/modules/saved/main_screen.dart';
import 'package:openarc_employer/modules/settings/main_screen.dart';
import 'package:openarc_employer/modules/settings/terms.dart';
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
  static final String jobListingRoute = "/job-list";
  static final String financeRoute = "/finance";
  static final String savedRoute = "/saved";
  static final String forgotPasswordRoute = "/forgot-password";
  static final String messageSendRoute = "/message-send";
  static final String userProfileRoute = "/user-profile";
  static final String companyProfileRoute = "/company-profile";

  //Unumplemented
  static final String disputeResolutionRoute = "/dispute-resolution";
  static final String locationRoute = "/location";
  static final String filterRoute = "/filter";
  static final String detailsExploreMemberRoute = "/details-explore-members";
  static final String jobDetailsUserRoute = "/job-details-user";
  static final String changePasswordRoute = "/change-password";
  static final String billingMethodsRoute = "/billing-methods";
  static final String successFundedJobRoute = "/success-fund-job";
  static final String subscriptionRoute = "/susbcription";
  static final String chatRoute = "/chat";
  static final String settingsRoute = "/settings";
  static final String subscriptionPackRoute = "/subscription-pack";
  static final String subscriptionPackDetailsRoute =
      "/subscription-pack-details";
  static final String postNewJobRoute = "/post-new-job";
  static final String termsRoute = "/terms-conditions";
  static final String jobDetailsModalRoute = "/job-details-modal";
  static final String loremIpsumRoute = "/lorem-ipsum";
  static final String reviewJobRoute = "/review-job";
  static final String jobDetailsRoute = "/job-details";

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
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.forgotPasswordRoute, page: ForgotPasswordScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.messageSendRoute, page: MessageSendRecoverScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.userProfileRoute, page: UserProfile()));
    KRouter().registerRoute(
        route:
            KRoute(name: KRoutes.companyProfileRoute, page: CompanyProfile()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.locationRoute, page: LocationScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.filterRoute, page: FilterScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.detailsExploreMemberRoute,
            page: DetailsExploreMembers()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.disputeResolutionRoute,
            page: DisputeResolutionScreen()));

    //Unumplemented views

    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.jobDetailsUserRoute, page: JobDetailsUserScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.changePasswordRoute, page: ChangePasswordScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.billingMethodsRoute, page: BillingMethodScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.successFundedJobRoute,
            page: SuccessFundedJobScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.subscriptionRoute, page: SubscriptionScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.chatRoute, page: ChatScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.settingsRoute, page: SettingScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.subscriptionPackRoute,
            page: SubscriptionPackScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.subscriptionPackDetailsRoute,
            page: SubscriptionPackDetailScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.postNewJobRoute, page: PostNewJob()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.termsRoute, page: ContractTermsScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.loremIpsumRoute, page: LoremIpsumScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.jobDetailsModalRoute, page: JobDetailsModalScreen()));
    KRouter().registerRoute(
        route: KRoute(
            name: KRoutes.reviewJobRoute, page: JobDetailsModalScreen()));
    KRouter().registerRoute(
        route: KRoute(name: KRoutes.jobDetailsRoute, page: JobDetailsScreen()));
  }
}
