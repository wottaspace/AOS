import 'package:okito/okito.dart';
import 'package:arcopen_enquirer/core/models/plan.dart';
import 'package:arcopen_enquirer/utils/helpers/loading_state.dart';
import 'package:arcopen_enquirer/utils/mixins/toast_mixin.dart';

class SubscriptionController extends OkitoController with ToastMixin {
  SubscriptionController._internal();
  static final SubscriptionController _singleton = SubscriptionController._internal();

  factory SubscriptionController() {
    return _singleton;
  }

  List<Plan> subscriptionPlans = [];
  Plan? activePlan;
  LoadingState loadingState = LoadingState.loading;

  Future<void> loadData() async {
    await getSubscriptionPlans();
    getActivePlan();
  }

  Future<void> getSubscriptionPlans() async {}

  void getActivePlan() {}
}
