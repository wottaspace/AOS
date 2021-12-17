import 'package:arcopen_enquirer/utils/mixins/logging_mixin.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:okito/okito.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Managing users subscriptions
class SubscriptionService extends OkitoController with LoggingMixin, ToastMixin {
  static final String revenueCatApiKey = dotenv.env["REVENUE_CAT_API_KEY"]!;
  String? activeSubscription;
  Future<void> init() async {
    await Purchases.setDebugLogsEnabled(kDebugMode);
    await Purchases.setup(revenueCatApiKey, appUserId: Okito.use<AuthService>().user.id);
  }

  Future<bool> _purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  Future<Offering?> getCurrentSubscription() async {
    PurchaserInfo purchaserInfo = await Purchases.getPurchaserInfo();
    if (purchaserInfo.activeSubscriptions.isNotEmpty) {
      final String sub = purchaserInfo.activeSubscriptions.first;
      if (sub.contains("gold")) {
        activeSubscription = "gold_enquirer";
      } else {
        activeSubscription = "enquirer";
      }
    }
  }

  Future<void> purchaseItem(String planId, PackageType duration) async {
    final offerings = await Purchases.getOfferings();
    Offering? offering;
    late String planName;

    /// First, we get the corresponding offering from RevenueCat
    if (planId.contains("gold")) {
      planName = "Gold Enquirer";
      offering = offerings.getOffering("gold_subscriptions");
    } else {
      planName = "Enquirer";
      offering = offerings.getOffering("subscriptions");
    }

    /// Then if we got something, we get the corresponding package
    if (offering != null) {
      try {
        final package = offering.availablePackages.firstWhere((element) => element.packageType == duration);
        if (await _purchasePackage(package)) {
          activeSubscription = planId;
          showSuccessToast("🎉 Congrats ! You've successfully subscribed to the $planName plan.");
        } else {
          showErrorToast("The purchase of the subscription failed. Please try again later.\nIf it persists, please contact support.");
        }
      } catch (e) {
        logger.d(e);
        showErrorToast("An unknown error prevents us from continuing. If it persists, please contact support.");
      }
    }
  }
}

/// IAP Plan
class IapPlan {
  final String id, name;

  IapPlan({
    required this.id,
    required this.name,
  });
}

enum IapPlanPeriod { monthly, yearly }
