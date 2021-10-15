import 'package:arcopen_enquirer/core/base_controller.dart';
import 'package:arcopen_enquirer/core/models/plan.dart';
import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/mixins/logging_mixin.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';
import 'package:arcopen_enquirer/utils/repositories/subscriptions_repository.dart';

class SubscriptionController extends BaseController with ToastMixin, LoggingMixin {
  static final SubscriptionController shared = SubscriptionController();
  final SubscriptionsRepository repository = SubscriptionsRepository();

  List<Plan> subscriptionPlans = [];
  Plan? activePlan;
  LoadingState state = LoadingState.loading;

  Future<void> loadData() async {
    await getSubscriptionPlans();
    getActivePlan();
  }

  Future<void> getSubscriptionPlans() async {
    setState(() {
      state = LoadingState.loading;
    });
    await repository.getSubscriptionPlans().then((value) {
      setState(() {
        state = LoadingState.success;
        subscriptionPlans = [...value.freePlans, ...value.employerPlans];
      });
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
      this.showErrorToast("Sorry, we are not able to load the data. Please try again later.");
    });
  }

  void getActivePlan() {
    repository.getActivePlan().then((value) {
      if (value.subscription.isNotEmpty) {
        this.activePlan = subscriptionPlans.firstWhere(
          ((element) => element.name == value.subscription.first.paymentStatus),
          orElse: () => this.subscriptionPlans.first,
        );
      }
    }).catchError((e) {
      logger.e(e.message, e);
    });
  }
}
