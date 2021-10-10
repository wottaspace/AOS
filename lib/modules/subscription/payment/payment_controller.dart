import 'package:okito/okito.dart';
import 'package:arcopen_enquirer/core/models/payment_card.dart';
import 'package:arcopen_enquirer/core/models/plan.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';

class PaymentController extends OkitoController with ToastMixin {
  List<PaymentCard> paymentMethods = [];

  PaymentCard? card;
  String? cvv;
  Plan? plan;
  String? billingCycle = "yearly";

  final List<String> billingCycles = ["monthly", "yearly"];

  set setSelectedPaymentMethod(PaymentCard card) {
    setState(() {
      this.card = card;
    });
  }

  set setSelectedBillingCycle(String cycle) {
    setState(() {
      this.billingCycle = cycle;
    });
  }

  Future<void> initialize() async {
    this.plan = Okito.arguments["plan"];
    if (this.plan == null) {
      this.showErrorToast("You need to choose a subscription plan first.");
      await Future.delayed(Duration(seconds: 3));
      Okito.pop();
    }
    this.getPaymentMethods();
  }

  getPaymentMethods() {}

  void paySubscription() {
    if (this.card == null) {
      this.showErrorToast("You need to choose a payment method first.");
      return;
    }
    if (this.cvv == null || (this.cvv?.isEmpty ?? true)) {
      this.showErrorToast("Please enter the cvv");
      return;
    }
    if (!this.billingCycles.contains(this.billingCycle)) {
      this.showErrorToast("Unknown billing cycle");
      return;
    }
  }
}
