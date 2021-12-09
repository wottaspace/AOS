import 'dart:async';

import 'package:arcopen_enquirer/utils/mixins/logging_mixin.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
// Import `in_app_purchase_android.dart` to be able to access the
// `InAppPurchaseAndroidPlatformAddition` class.
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:flutter/foundation.dart';
import 'package:okito/okito.dart';

/// Managing users subscriptions
class SubscriptionService extends OkitoController with LoggingMixin, ToastMixin {
  late final InAppPurchase _inAppPurchase;
  late final List<ProductDetails> products;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  final List<IapPlan> plans = [
    IapPlan(
      id: "enquirer_monthly_plan",
      name: "Enquirer Monthly",
      period: IapPlanPeriod.monthly,
    ),
    IapPlan(
      id: "gold_enquirer_monthly",
      name: "Gold Enquirer Monthly",
      period: IapPlanPeriod.monthly,
    ),
    IapPlan(
      id: "enquirer_yearly_plan",
      name: "Enquirer Yearly",
      period: IapPlanPeriod.yearly,
    ),
    IapPlan(
      id: "gold_enquirer_yearly_plan",
      name: "Gold Enquirer Yearly",
      period: IapPlanPeriod.yearly,
    ),
  ];

  List<String> get _productIds {
    return plans.map<String>((IapPlan plan) => plan.id).toList();
  }

  init() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
    }
    _inAppPurchase = InAppPurchase.instance;
    initStoreInfo();
    _listenPurchaseSubscriptions();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (isAvailable) {
      final ProductDetailsResponse response = await _inAppPurchase.queryProductDetails(_productIds.toSet());
      if (response.notFoundIDs.isNotEmpty) {
        logger.e("Not found ids");
      }
      products = response.productDetails;
    } else {
      logger.d("Store unavailable");
    }
  }

  void _listenPurchaseSubscriptions() {
    _subscription = _inAppPurchase.purchaseStream.listen((List<PurchaseDetails> list) {
      print(list);
      _listenToPurchasedUpdate(list);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      logger.e(error);
    });
  }

  void _listenToPurchasedUpdate(List<PurchaseDetails> purchasedDetailsList) {
    purchasedDetailsList.forEach((purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        logger.d("Show pending UI");
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        showErrorToast("Subscription payment failed. Please try again later.");
      } else if (purchaseDetails.status == PurchaseStatus.purchased) {
        bool isPuchaseValid = await _verifyPurchase(purchaseDetails);
        if (isPuchaseValid) {
          logger.d("Purchase valid");
        } else {
          logger.d("Invalid purchase");
        }
      }
    });
  }

  purchaseItem(String id) async {
    final productDetails = products.firstWhere((element) => element.id == id);
    if (await _inAppPurchase.buyNonConsumable(
      purchaseParam: PurchaseParam(
        productDetails: productDetails,
        applicationUserName: Okito.use<AuthService>().user.id,
      ),
    )) {
      // ToDO: save purchase
    }
  }

  _verifyPurchase(PurchaseDetails details) {
    return Future.value(true);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

/// IAP Plan
class IapPlan {
  final String id;
  final String name;
  final IapPlanPeriod period;

  IapPlan({
    required this.id,
    required this.name,
    required this.period,
  });
}

enum IapPlanPeriod { monthly, yearly }
